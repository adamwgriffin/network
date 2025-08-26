# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :send_connection_request, mutation: Mutations::SendConnectionRequest
  end
end
