class Post < ApplicationRecord
  extend FriendlyId

  friendly_id :title

  belongs_to :user
  has_many :post_comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true

  private

    def should_generate_new_friendly_id?
      slug.blank? || title_changed?
    end
end
