# frozen_string_literal: true

module Types
  # Define all GraphQL queries here
  class QueryType < Types::BaseObject
    description 'lists all the existing queries'

    field :me, resolver: Resolvers::Me, description: 'returns current user informations'
  end
end
