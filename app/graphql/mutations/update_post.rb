# frozen_string_literal: true

module Mutations
  class UpdatePost < Mutations::BaseMutation
    argument :post_id, ID, required: true
    argument :body, String, required: true

    field :success, Boolean, null: false
    field :errors, [String], null: false

    def resolve(post_id:, body:)
      Post.find(post_id).update!(body: body)
      { success: true, errors: [] }
    rescue => e
      { success: false, errors: [e.message] }
    end
  end
end
