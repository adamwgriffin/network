# frozen_string_literal: true

class User < ApplicationRecord
  belongs_to :company

  has_many :sent_connections, class_name: "Connection", foreign_key: "requester_id", dependent: :destroy
  has_many :received_connections, class_name: "Connection", foreign_key: "recipient_id", dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true

  def connections
    Connection.where(
      "(requester_id = ? OR recipient_id = ?) AND status = 'accepted'",
      id,
      id
    )
  end

  def connected_users
    connection_ids = connections.pluck(:requester_id, :recipient_id).flatten - [ id ]
    User.where(id: connection_ids)
  end

  def pending_sent_requests
    sent_connections.pending
  end

  def pending_received_requests
    received_connections.pending
  end

  def connect_user_to(recipient, status = "accepted")
    Connection.create!(
      requester: self,
      recipient: recipient,
      status: status
    )
  end

  def accept_connection_request(requester)
    connection = received_connections.find_by(requester: requester, status: "pending")
    return false unless connection

    connection.update(status: "accepted")
  end

  def decline_connection_request(requester)
    connection = received_connections.find_by(requester: requester, status: "pending")
    return false unless connection

    connection.update(status: "declined")
  end

  def remove_connection(other_user)
    connection = Connection.find_by(
      "(requester_id = ? AND recipient_id = ?) OR (requester_id = ? AND recipient_id = ?)",
      id,
      other_user.id,
      other_user.id,
      id
    )

    connection&.destroy
  end
end
