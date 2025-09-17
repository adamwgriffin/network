# frozen_string_literal: true

module Mutations
  class DestroyPost < Mutations::BaseMutation
    argument :post_id, ID, required: true

    field :success, Boolean, null: false
    field :errors, [String], null: false

    def resolve(post_id:)
      Post.find(post_id).destroy!
      { success: true, errors: [] }
    rescue => e
      { success: false, errors: [e.message] }
    end
  end
end
