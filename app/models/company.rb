class Company < ApplicationRecord
  extend FriendlyId

  has_many :users

  friendly_id :name

  validates :name, presence: true
  validates :headquarters, presence: true

  private

    def should_generate_new_friendly_id?
      slug.blank? || name_changed?
    end
end
