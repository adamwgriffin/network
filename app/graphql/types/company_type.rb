# frozen_string_literal: true

module Types
  class CompanyType < Types::BaseObject
    field :id, ID, null: false
    field :slug, String, null: false do
      description "A slug ID to be used in an SEO-friendly URI"
    end
    field :name, String, null: false
    field :headquarters, String, null: false do
      description "The geographic location of the company"
    end
    field :description, String, null: true
    field :users, Types::UserType.connection_type, null: false do
      description "Return a paginated list of users"
    end

    def users
      object.users
    end
  end
end
