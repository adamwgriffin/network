# frozen_string_literal: true

module Mutations
  class SendConnectionRequest < Mutations::BaseMutation
    argument :sender_id, ID, required: true
    argument :receiver_id, ID, required: true

    field :success, Boolean, null: false
    field :errors, [String], null: false

    def resolve(sender_id:, receiver_id:)
      ConnectionRequest.create!(sender_id: sender_id, receiver_id: receiver_id)
      { success: true, errors: [] }
    rescue => e
      { success: false, errors: [e.message] }
    end
  end
end
