class Company < ApplicationRecord
  extend FriendlyId

  has_many :users

  friendly_id :name

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end

  validates :name, presence: true
  validates :headquarters, presence: true
end
