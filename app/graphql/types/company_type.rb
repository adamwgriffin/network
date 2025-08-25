# frozen_string_literal: true

module Types
  class CompanyType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :users, [ Types::UserType ], null: true

    def users
      object.users
    end
  end
end
