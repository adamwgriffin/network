require 'rails_helper'

RSpec.describe Connection, type: :model do
  let(:house) { create(:house) }
  let(:wilson)  { create(:wilson) }

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
end
