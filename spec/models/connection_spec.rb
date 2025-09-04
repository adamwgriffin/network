require 'rails_helper'

RSpec.describe Connection, type: :model do
  let(:house) { create(:house) }
  let(:wilson)  { create(:wilson) }

  describe "validation" do
    describe "users_are_different" do
      it "is invalid if requester and recipient are the same user" do
        connection = build(:connection, user: house, connected_user: house)
        expect(connection).not_to be_valid
        expect(connection.errors[:connected_user_id]).to include("can't be same as user")
      end
    end
  end

  describe "#connect" do
    it "creates two mutual connection records" do
      Connection.connect(house.id, wilson.id)

      expect(Connection.exists?(user_id: house.id, connected_user_id: wilson.id)).to eq(true)
      expect(Connection.exists?(user_id: wilson.id, connected_user_id: house.id)).to eq(true)
    end
  end

  describe "#disconnect" do
    it "removes the connections between two users" do
      connection_one = create(:connection, user: house, connected_user: wilson)
      connection_two = create(:connection, user: wilson, connected_user: house)
      Connection.disconnect(house.id, wilson.id)

      expect(Connection.exists?(connection_one.id)).to eq(false)
      expect(Connection.exists?(connection_two.id)).to eq(false)
    end
  end
end
