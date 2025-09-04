# frozen_string_literal: true

module Types
  class ConnectionRequestType < Types::BaseObject
    field :id, ID, null: false
    field :sender_id, Integer, null: false
    field :receiver_id, Integer, null: false
    field :status, String, null: false
    field :responded_at, GraphQL::Types::ISO8601DateTime
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :sender, Types::UserType, null: false do
      description "The user that sent the connection request"
    end
    field :receiver, Types::UserType, null: false do
      description "The user that recieved the connection request"
    end
  end
end
