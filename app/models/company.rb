class Company < ApplicationRecord
  has_many :users

  validates :name, presence: true
  validates :headquarters, presence: true
end
