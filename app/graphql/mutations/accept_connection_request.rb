# frozen_string_literal: true

module Mutations
  class AcceptConnectionRequest < Mutations::BaseMutation
    argument :connection_request_id, ID, required: true

    field :success, Boolean, null: false
    field :errors, [String], null: false

    def resolve(connection_request_id:)
      ConnectionRequest.find(connection_request_id).accept
      { success: true, errors: [] }
    rescue => e
      { success: false, errors: [e.message] }
    end
  end
end
