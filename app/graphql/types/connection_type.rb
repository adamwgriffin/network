# frozen_string_literal: true

module Types
  class ConnectionType < Types::BaseObject
    field :id, ID, null: false
    field :requester_id, Integer, null: false
    field :recipient_id, Integer, null: false
    field :status, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :requester, Types::UserType, null: false do
      description "The user who sent the connection request"
    end
    field :recipient, Types::UserType, null: false do
      description "The user who received the connection request"
    end
  end
end
