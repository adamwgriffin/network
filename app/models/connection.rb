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

  private

    def users_are_different
      errors.add(:recipient_id, "can't be the same as requester") if requester_id == recipient_id
    end
end
