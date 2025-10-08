# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Types::PostType do
  include GraphQL::Testing::Helpers.for(NetworkSchema)

  let(:user) { create(:user) }
  let(:post) { create(:post, user: user) }

  it "returns the available fields" do
    with_resolution_context(type: "Post", object: post) do |rc|
      expect(rc.run_graphql_field("id")).to eq(post.id)
      expect(rc.run_graphql_field("body")).to eq(post.body)
      expect(rc.run_graphql_field("user")).to eq(post.user)
      expect(rc.run_graphql_field("createdAt")).to eq(post.created_at)
      expect(rc.run_graphql_field("updatedAt")).to eq(post.updated_at)
    end
  end

  describe 'post_comments field' do
    it "returns post comments" do
      comment1 = create(:post_comment, post: post, user: user)
      comment2 = create(:post_comment, post: post, user: user)

      result = run_graphql_field("Post.postComments", post)

      expect(result.nodes).to match_array([comment1, comment2])
    end

    it 'returns empty array when post has no comments' do
      result = run_graphql_field("Post.postComments", post)

      expect(result.nodes).to be_empty
    end

    it 'supports pagination arguments' do
      create_list(:post_comment, 5, post: post, user: user)

      result = run_graphql_field("Post.postComments", post, arguments: { first: 2 })

      expect(result.nodes.size).to eq(2)
      expect(result.page_info.has_next_page).to be true
    end
  end
end
