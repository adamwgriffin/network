require 'rails_helper'

RSpec.describe ConnectionRequest, type: :model do
  let(:house) { create(:house) }
  let(:wilson)  { create(:wilson) }

  describe "validation" do
    describe "users_are_different" do
      it "is invalid if sender and receiver are the same user" do
        request = build(:connection_request, sender: house, receiver: house)
        expect(request).not_to be_valid
        expect(request.errors[:receiver_id]).to include("can't be same as sender")
      end
    end
  end

  describe "#accept" do
    it "accepts a pending connection request" do
      request = create(:connection_request, sender: house, receiver: wilson)
      # Make sure test for responded_at is deterministic by using freeze_time
      freeze_time do
        now = Time.current
        request.accept
        request.reload
        expect(request.responded_at).to eq(now)
      end

      expect(request.status).to eq("accepted")
      expect(request.sender.connected_users).to include(wilson)
      expect(request.receiver.connected_users).to include(house)
    end
  end

  describe "#decline" do
    it "declines a pending connection request" do
      request = create(:connection_request, sender: house, receiver: wilson)
      freeze_time do
        now = Time.current
        request.decline
        request.reload
        expect(request.responded_at).to eq(now)
      end

      expect(request.status).to eq("declined")
      expect(request.sender.connected_users).not_to include(wilson)
      expect(request.receiver.connected_users).not_to include(house)
    end
  end
end
