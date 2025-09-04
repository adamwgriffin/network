# frozen_string_literal: true

class User < ApplicationRecord
  belongs_to :company
  has_many :connections
  has_many :connected_users, through: :connections
  has_many :sent_connection_requests, class_name: "ConnectionRequest", foreign_key: :sender_id
  has_many :received_connection_requests, class_name: "ConnectionRequest", foreign_key: :receiver_id

  validates :first_name, presence: true
  validates :last_name, presence: true
end
