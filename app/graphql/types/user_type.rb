# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :company_id, Integer, null: false
    field :first_name, String, null: false
    field :last_name, String, null: false
    field :company, Types::CompanyType, null: true
    field :connections,
      [ Types::UserType ],
      null: true,
      description: "All accepted connections for this user"
    field :pending_sent_requests,
      [ Types::UserType ],
      null: true,
      description: "Users this user has sent a pending connection request to"
    field :pending_received_requests,
      [ Types::UserType ],
      null: true,
      description: "Users who have sent a pending connection request to this user"

    def connections
      object.connections
    end

    def pending_sent_requests
      object.pending_sent_requests
    end

    def pending_received_requests
      object.pending_received_requests
    end
  end
end
