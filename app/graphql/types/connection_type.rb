# frozen_string_literal: true

module Types
  class ConnectionType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer, null: false
    field :connected_user_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :user, Types::UserType, null: false do
      description "The user that this connection belongs to"
    end
    field :connected_user, Types::UserType, null: false do
      description "The other user that this user is connected to"
    end
  end
end
