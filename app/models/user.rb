# frozen_string_literal: true

class User < ApplicationRecord
  extend FriendlyId

  belongs_to :company

  has_many :sent_connections, class_name: "Connection", foreign_key: "requester_id", dependent: :destroy
  has_many :received_connections, class_name: "Connection", foreign_key: "recipient_id", dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true

  friendly_id :slug_candidates

  # Fields used to generate the slug via the friendly_id method
  def slug_candidates
    [
      [first_name, last_name]
    ]
  end

  # Updates the slug if any of these conditions are true
  def should_generate_new_friendly_id?
    slug.blank? || first_name_changed? || last_name_changed?
  end

  def connections
    User.joins(
      "JOIN connections ON users.id = connections.requester_id OR users.id = connections.recipient_id"
    )
    .where(
      "connections.requester_id = :id OR connections.recipient_id = :id",
      id: self.id
    )
    .where("connections.status = 'accepted'")
    .where.not(id: self.id)
    .distinct
  end

  def pending_sent_requests
    sent_connections.pending
  end

  def pending_received_requests
    received_connections.pending
  end
end
