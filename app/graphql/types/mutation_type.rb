# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :send_connection_request, mutation: Mutations::SendConnectionRequest
    field :accept_connection_request, mutation: Mutations::AcceptConnectionRequest
    field :decline_connection_request, mutation: Mutations::DeclineConnectionRequest
    field :remove_connection, mutation: Mutations::RemoveConnection
    field :create_post, mutation: Mutations::CreatePost
    field :update_post, mutation: Mutations::UpdatePost
    field :destroy_post, mutation: Mutations::DestroyPost
  end
end
