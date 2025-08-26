# frozen_string_literal: true

class User < ApplicationRecord
  belongs_to :company

  has_many :sent_connections, class_name: "Connection", foreign_key: "requester_id", dependent: :destroy
  has_many :received_connections, class_name: "Connection", foreign_key: "recipient_id", dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true

  def connections
    # Get all the user ids, removing this user from the array
    user_ids = Connection
      .user_connections(self)
      .pluck(:requester_id, :recipient_id).flatten - [ id ]
    User.where(id: user_ids)
  end

  def pending_sent_requests
    sent_connections.pending.includes(:recipient).map(&:recipient)
  end

  def pending_received_requests
    received_connections.pending.includes(:requester).map(&:requester)
  end
end
