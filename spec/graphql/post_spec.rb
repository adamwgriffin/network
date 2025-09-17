require 'rails_helper'

RSpec.describe 'GraphQL Post', type: :request do
  let(:user) { create(:user) }
  let(:feed_post) { create(:post, user: user) }

  let(:headers) { { 'Content-Type' => 'application/json' } }

  it 'creates a post' do
    mutation = <<~HEREDOC
      mutation {
        createPost(input: { userId: #{user.id}, body: "Hello" }) {
          postId
          success
          errors
        }
      }
    HEREDOC
    post '/graphql', params: { query: mutation }.to_json, headers: headers
    json = JSON.parse(response.body)
    expect(json['data']['createPost']['success']).to eq true
    expect(json['data']['createPost']['postId']).to be_present
  end

  it 'finds a post' do
    query = <<~HEREDOC
      query {
        post(id: #{feed_post.id}) {
          id
          body
        }
      }
    HEREDOC
    post '/graphql', params: { query: query }.to_json, headers: headers
    json = JSON.parse(response.body)
    expect(json['data']['post']['id']).to eq(feed_post.id.to_s)
    expect(json['data']['post']['body']).to eq(feed_post.body)
  end

  it 'updates a post' do
    mutation = <<~HEREDOC
      mutation {
        updatePost(input: { postId: #{feed_post.id}, body: "Updated body" }) {
          success
          errors
        }
      }
    HEREDOC
    post '/graphql', params: { query: mutation }.to_json, headers: headers
    json = JSON.parse(response.body)
    expect(json['data']['updatePost']['success']).to eq true
    feed_post.reload
    expect(feed_post.body).to eq("Updated body")
  end

  it 'destroys a post' do
    mutation = <<~HEREDOC
      mutation {
        destroyPost(input: { postId: #{feed_post.id} }) {
          success
          errors
        }
      }
    HEREDOC
    post '/graphql', params: { query: mutation }.to_json, headers: headers
    json = JSON.parse(response.body)
    expect(json['data']['destroyPost']['success']).to eq true
    expect(Post.exists?(feed_post.id)).to eq false
  end
end
