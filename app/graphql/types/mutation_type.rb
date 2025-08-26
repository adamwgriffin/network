# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :send_connection_request, mutation: Mutations::SendConnectionRequest
    field :accept_connection_request, mutation: Mutations::AcceptConnectionRequest
  end
end
