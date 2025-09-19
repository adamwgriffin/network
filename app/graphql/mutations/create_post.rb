# frozen_string_literal: true

module Mutations
  class CreatePost < Mutations::BaseMutation
    argument :user_id, ID, required: true
    argument :body, String, required: true

    field :success, Boolean, null: false
    field :post_id, ID, null: true
    field :errors, [String], null: false

    def resolve(user_id:, body:)
      post = Post.create!(user_id: user_id, body: body)
      { success: true, post_id: post.id, errors: [] }
    rescue => e
      { success: false, errors: [e.message] }
    end
  end
end
