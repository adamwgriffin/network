# frozen_string_literal: true

module Types
  class PostType < Types::BaseObject
    description "A network post"
    field :id, ID, null: false
    field :body, String, null: false
    field :post_comments, [Types::PostCommentType] do
      description "User comments on this post"
    end
    field :user, Types::UserType, description: "The post author", null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
