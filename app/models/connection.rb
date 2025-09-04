# frozen_string_literal: true

class Connection < ApplicationRecord
  STATUSES = %w[pending accepted declined blocked].freeze

  belongs_to :requester, class_name: "User"
  belongs_to :recipient, class_name: "User"

  validates :requester_id, uniqueness: { scope: :recipient_id }
  validates :status, inclusion: { in: STATUSES }
  validate :users_are_different

  scope :pending, -> { where(status: "pending") }
  scope :accepted, -> { where(status: "accepted") }
  scope :declined, -> { where(status: "declined") }
  scope :blocked, -> { where(status: "blocked") }

  scope :for_users, ->(user_a, user_b) do
    where(requester: user_a, recipient: user_b)
      .or(where(requester: user_b, recipient: user_a))
  end

  def self.send_connection_request(requester_id, recipient_id)
    raise "Cannot connect a user to themselves" if requester_id == recipient_id
    existing_connection = self.for_users(requester_id, recipient_id).exists?
    raise "Connection already exists" if existing_connection
    Connection.create!(requester_id: requester_id, recipient_id: recipient_id)
  end

  def self.accept_request(connection_id)
    connection = self.find(connection_id)
    raise "Request is not pending" if connection.status != "pending"
    connection.update!(status: "accepted")
  end

  def self.decline_request(connection_id)
    connection = self.find(connection_id)
    raise "Request is not pending" if connection.status != "pending"
    connection.update!(status: "declined")
  end

  def self.remove_connection(connection_id)
    self.find(connection_id)&.destroy!
  end

  private

    def users_are_different
      errors.add(:recipient_id, "can't be the same as requester") if requester_id == recipient_id
    end
end
