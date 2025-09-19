# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    description "A user of the social network"
    field :id, ID, null: false
    field :slug, String, null: false do
      description "A slug ID to be used in an SEO-friendly URI"
    end
    field :first_name, String, null: false
    field :middle_name, String, null: true
    field :last_name, String, null: false
    field :nickname, String, null: true
    field :credentials, String, null: true do
      description "The post-nominal letters (e.g., M.D.) for the user"
    end
    field :name_with_credentials, String, null: false do
      description "The user's full name and credentials, if any exist"
    end
    field :about, String, null: true
    field :company, Types::CompanyType, null: false
    field :connections, Types::UserType.connection_type, null: true do
      description "A paginated list of connections for this user"
    end
    field :pending_sent_requests, [Types::ConnectionType], null: true do
      description "Pending connection requests sent by this user"
    end
    field :pending_received_requests, [Types::ConnectionType], null: true do
      description "Pending connection requests received by this user"
    end
    field :posts, Types::PostType.connection_type, null: false do
      description "A paginated list of posts for this user"
    end

    def posts
      object.posts.order(created_at: :desc)
    end
  end
end
