# frozen_string_literal: true

module Mutations
  class RemoveConnection < Mutations::BaseMutation
    argument :user_a_id, ID, required: true
    argument :user_b_id, ID, required: true

    field :success, Boolean, null: false
    field :errors, [String], null: false

    def resolve(user_a_id:, user_b_id:)
      begin
        Connection.remove_connection(user_a_id, user_b_id)
        { success: true, errors: [] }
      rescue => e
        { success: false, errors: [e.message] }
      end
    end
  end
end
