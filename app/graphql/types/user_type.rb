# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :company_id, Integer, null: false
    field :first_name, String, null: false
    field :middle_name, String, null: true
    field :last_name, String, null: false
    field :nickname, String, null: true
    field :company, Types::CompanyType, null: false
    field :credentials, String, null: true do
      description "The post-nominal letters (e.g., M.D.) for the user"
    end
    field :connections, [Types::UserType], null: true do
      description "All accepted connections for this user"
    end
    field :pending_sent_requests, [Types::ConnectionRequestType], null: true do
      description "Pending connection requests sent by this user"
    end
    field :pending_received_requests, [Types::ConnectionRequestType], null: true do
      description "Pending connection requests received by this user"
    end

    def connections
      object.connected_users
    end

    # TODO: This includes isn't right. We need to use eager_load instead, and
    # figure out what is being requested so we can do this more efficiently
    def pending_sent_requests
      object.pending_sent_requests.includes(:receiver)
    end

    def pending_received_requests
      object.pending_received_requests.includes(:sender)
    end
  end
end
