# frozen_string_literal: true

class User < ApplicationRecord
  belongs_to :company

  has_many :connections
  has_many :connected_users, through: :connections

  validates :first_name, presence: true
  validates :last_name, presence: true
end
