# frozen_string_literal: true

class User < ApplicationRecord
  belongs_to :company

  has_many :sent_connections, class_name: "Connection", foreign_key: "requester_id", dependent: :destroy
  has_many :received_connections, class_name: "Connection", foreign_key: "recipient_id", dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true

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
