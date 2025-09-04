# frozen_string_literal: true

class Connection < ApplicationRecord
  belongs_to :user
  belongs_to :connected_user, class_name: "User"

  # Makes sure the specific user_id -> connected_user_id combo is unique
  validates :user_id, uniqueness: { scope: :connected_user_id }
  validate :users_are_different

  # TODO: Optimize these two queries for connect and disconnect

  # Create a mutual connection between two users. We create two records: one for
  # each user. This takes up more space but it makes queries for user
  # connections a lot less complex. Having tried using only one record
  # previously, I decided the tradeoff could be worthwhile in the long run.
  def self.connect(user_id_1, user_id_2)
    transaction do
      create!(user_id: user_id_1, connected_user_id: user_id_2)
      create!(user_id: user_id_2, connected_user_id: user_id_1)
    end
  end

  # Remove a mutual connection between two users
  def self.disconnect(user_id_1, user_id_2)
    transaction do
      find_by!(user_id: user_id_1, connected_user_id: user_id_2).destroy!
      find_by!(user_id: user_id_2, connected_user_id: user_id_1).destroy!
    end
  end

  private

    def users_are_different
      errors.add(:connected_user_id, "can't be same as user") if user_id == connected_user_id
    end
end
