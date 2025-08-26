# frozen_string_literal: true

module Mutations
  class AcceptConnectionRequest < Mutations::BaseMutation
    argument :requester_id, ID, required: true
    argument :recipient_id, ID, required: true

    field :success, Boolean, null: false
    field :errors, [ String ], null: false

    def resolve(requester_id:, recipient_id:)
      Connection.accept_request(requester_id, recipient_id)
      { success: true, errors: [] }
    rescue => e
      { success: false, errors: [ e.message ] }
    end
  end
end
