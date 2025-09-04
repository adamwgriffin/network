require 'rails_helper'

RSpec.describe User, type: :model do
  let(:house) { create(:house) }
  let(:wilson)  { create(:wilson) }
  let(:cameron) { create(:cameron) }
  let(:thirteen) { create(:thirteen) }

  describe "#pending_sent_requests" do
    it "returns sent connection requests that are still pending" do
      pending_request = create(:connection_request, sender: house, receiver: thirteen, status: "pending")
      accepted_request = create(:connection_request, sender: house, receiver: wilson, status: "accepted")
      declined_request = create(:connection_request, sender: house, receiver: cameron, status: "declined")

      expect(house.pending_sent_requests).to include(pending_request)

      expect(house.pending_sent_requests).not_to include(accepted_request)
      expect(house.pending_sent_requests).not_to include(declined_request)
    end
  end

  describe "#pending_received_requests" do
    it "returns received connection requests that are still pending" do
      pending_request = create(:connection_request, sender: thirteen, receiver: house, status: "pending")
      accepted_request = create(:connection_request, sender: wilson, receiver: house, status: "accepted")
      declined_request = create(:connection_request, sender: cameron, receiver: house, status: "declined")

      expect(house.pending_received_requests).to include(pending_request)

      expect(house.pending_received_requests).not_to include(accepted_request)
      expect(house.pending_received_requests).not_to include(declined_request)
    end
  end
end
