# frozen_string_literal: true

class User < ApplicationRecord
  extend FriendlyId

  belongs_to :company

  has_many :sent_connections, class_name: "Connection", foreign_key: "requester_id", dependent: :destroy
  has_many :received_connections, class_name: "Connection", foreign_key: "recipient_id", dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true

  friendly_id :name

  # Find users that have no connection record for user_id. Using NOT EXISTS with
  # a subquery like this is apparenlty supposed to be more effecient than doing
  # something like an outer join instead
  scope :without_connection_to, ->(user_id) {
    where(
      %{
        NOT EXISTS (
          SELECT 1
          FROM connections c
          WHERE (c.requester_id = ? AND c.recipient_id = users.id)
            OR (c.recipient_id = ? AND c.requester_id = users.id)
        )
      },
      user_id,
      user_id
    )
  }

  def name
    "#{first_name} #{last_name}"
  end

  def name_with_credentials
    credentials? ? "#{name}, #{credentials}" : name
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

  private

    # Updates the slug if any of these conditions are true
    def should_generate_new_friendly_id?
      slug.blank? || first_name_changed? || last_name_changed?
    end
end
