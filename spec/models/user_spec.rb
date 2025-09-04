require 'rails_helper'

RSpec.describe User, type: :model do
  let(:house) { create(:house) }
  let(:wilson)  { create(:wilson) }
  let(:cameron) { create(:cameron) }
  let(:cuddy) { create(:cuddy) }
  let(:thirteen) { create(:thirteen) }

  describe "#connections" do
    it "returns all accepted connections for a user" do
      create(:connection, requester: house, recipient: wilson, status: "accepted")
      create(:connection, requester: cuddy, recipient: house, status: "pending")
      create(:connection, requester: house, recipient: thirteen, status: "declined")

      expect(house.connections).to include(wilson)

      expect(house.connections).not_to include(cuddy)
      expect(house.connections).not_to include(thirteen)
    end
  end

  describe "#pending_sent_requests" do
    it "returns sent connection requests that are still pending" do
      pending_connection = create(:connection, requester: house, recipient: thirteen, status: "pending")
      accepted_connection = create(:connection, requester: house, recipient: wilson, status: "accepted")
      declined_connection = create(:connection, requester: house, recipient: cameron, status: "declined")

      expect(house.pending_sent_requests).to include(pending_connection)

      expect(house.pending_sent_requests).not_to include(accepted_connection)
      expect(house.pending_sent_requests).not_to include(declined_connection)
    end
  end

  describe "#pending_received_requests" do
    it "returns received connection requests that are still pending" do
      pending_connection = create(:connection, requester: thirteen, recipient: house, status: "pending")
      accepted_connection = create(:connection, requester: wilson, recipient: house, status: "accepted")
      declined_connection = create(:connection, requester: cameron, recipient: house, status: "declined")

      expect(house.pending_received_requests).to include(pending_connection)

      expect(house.pending_received_requests).not_to include(accepted_connection)
      expect(house.pending_received_requests).not_to include(declined_connection)
    end
  end
end
