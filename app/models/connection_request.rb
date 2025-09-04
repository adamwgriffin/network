# frozen_string_literal: true

class ConnectionRequest < ApplicationRecord
  STATUSES = %w[pending accepted declined].freeze

  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"

  validates :sender_id, uniqueness: { scope: :receiver_id }
  validates :status, inclusion: { in: STATUSES }
  validate :users_are_different

  scope :pending, -> { where(status: "pending") }
  scope :accepted, -> { where(status: "accepted") }
  scope :declined, -> { where(status: "declined") }

  def accept
    transaction do
      update!(status: "accepted", responded_at: Time.current)
      Connection.connect(sender_id, receiver_id)
    end
  end

  def decline
    update!(status: "declined", responded_at: Time.current)
  end

  private

    def users_are_different
      errors.add(:receiver_id, "can't be same as sender") if sender_id == receiver_id
    end
end
