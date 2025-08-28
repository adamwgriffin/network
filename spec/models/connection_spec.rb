require 'rails_helper'

RSpec.describe Connection, type: :model do
  let(:house) { create(:house) }
  let(:wilson)  { create(:wilson) }
  let(:cameron) { create(:cameron) }

  describe "#send_connection_request" do
    it "creates a new connection with pending status" do
      connection = Connection.send_connection_request(house.id, wilson.id)
      expect(connection).to be_persisted
      expect(connection.requester).to eq(house)
      expect(connection.recipient).to eq(wilson)
      expect(connection.status).to eq("pending")
    end

    it "raises an error if requester and recipient are the same" do
      expect {
        Connection.send_connection_request(house.id, house.id)
      }.to raise_error("Cannot connect a user to themselves")
    end

    it "raises an error if a connection already exists between users" do
      Connection.send_connection_request(house.id, wilson.id)
      expect {
        Connection.send_connection_request(house.id, wilson.id)
      }.to raise_error("Connection already exists")
      expect {
        Connection.send_connection_request(wilson.id, house.id)
      }.to raise_error("Connection already exists")
    end
  end

  describe "#accept_request" do
    it "accepts a pending connection request" do
      pending_connection = create(:connection, requester: house, recipient: wilson, status: "pending")
      Connection.accept_request(pending_connection.id)
      expect(pending_connection.reload.status).to eq("accepted")
    end

    it "raises an error if the request is not pending" do
      accepted_connection = create(:connection, requester: house, recipient: cameron, status: "accepted")
      expect {
        Connection.accept_request(accepted_connection.id)
      }.to raise_error("Request is not pending")
    end
  end

  describe "#decline_request" do
    it "declines a pending connection request" do
      pending_connection = create(:connection, requester: house, recipient: wilson, status: "pending")
      Connection.decline_request(pending_connection.id)
      expect(pending_connection.reload.status).to eq("declined")
    end

    it "raises an error if the request is not pending" do
      declined_connection = create(:connection, requester: house, recipient: cameron, status: "declined")
      expect {
        Connection.decline_request(declined_connection.id)
      }.to raise_error("Request is not pending")
    end
  end
end
