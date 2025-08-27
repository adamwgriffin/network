# frozen_string_literal: true

module Mutations
  class RemoveConnection < Mutations::BaseMutation
    argument :connection_id, ID, required: true

    field :success, Boolean, null: false
    field :errors, [String], null: false

    def resolve(connection_id:)
      Connection.remove_connection(connection_id)
      { success: true, errors: [] }
    rescue => e
      { success: false, errors: [e.message] }
    end
  end
end
