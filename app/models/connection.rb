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
  scope :for_users, ->(user_a, user_b) {
    where(requester: user_a, recipient: user_b)
      .or(where(requester: user_b, recipient: user_a))
  }

  # Find all accepted connection requests for a user
  def self.user_connections(user)
    where(requester: user)
      .or(where(recipient: user))
      .where(status: "accepted")
  end

  # You can pass either a user id or a user model as arguments
  def self.accept_request(requester, recipient)
    self
      .find_by!(requester: requester, recipient: recipient, status: "pending")
      .update!(status: "accepted")
  end

  def self.decline_request(requester, recipient)
    self
      .find_by!(requester: requester, recipient: recipient, status: "pending")
      .update!(status: "declined")
  end

  def self.remove_connection(user_a, user_b)
    self.for_users(user_a, user_b)
      .take!
      .destroy!
  end

  private

    def users_are_different
      errors.add(:recipient_id, "can't be the same as requester") if requester_id == recipient_id
    end
end
