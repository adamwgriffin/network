# frozen_string_literal: true

module Mutations
  class AcceptConnectionRequest < Mutations::BaseMutation
    argument :connection_id, ID, required: true

    field :success, Boolean, null: false
    field :errors, [String], null: false

    def resolve(connection_id:)
      Connection.accept_request(connection_id)
      { success: true, errors: [] }
    rescue => e
      { success: false, errors: [e.message] }
    end
  end
end
