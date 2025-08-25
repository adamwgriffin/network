# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :node, Types::NodeType, null: true do
      description "Fetches an object given its ID."
      argument :id, ID, required: true, description: "ID of the object."
    end

    def node(id:)
      context.schema.object_from_id(id, context)
    end

    field :nodes, [ Types::NodeType, null: true ], null: true do
      description "Fetches a list of objects given a list of IDs."
      argument :ids, [ ID ], required: true, description: "IDs of the objects."
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :user, Types::UserType, null: true do
      description "Find a user by database ID"
      argument :id, ID, required: true
    end

    def user(id:)
      User.find_by(id: id)
    end

    field :company, Types::CompanyType, null: true do
      description "Find a company by database ID"
      argument :id, ID, required: true
    end

    def company(id:)
      Company.find_by(id: id)
    end

    field :users, [ Types::UserType ], null: false,
      description: "Return a list of users"

    def users
      User.all
    end

    field :companies, [ Types::CompanyType ], null: false,
      description: "Return a list of companies"

    def companies
      Company.all
    end
  end
end
