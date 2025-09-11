# frozen_string_literal: true

module Types
  class CompanyType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :headquarters, String, null: false
    field :description, String, null: true
    field :users, Types::UserType.connection_type, null: false do
      description "Return a paginated list of users"
    end

    def users
      object.users
    end
  end
end
