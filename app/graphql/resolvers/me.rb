# frozen_string_literal: true

module Resolvers
  # allow current user to query its own datas
  class Me < BaseResolver
    description 'returns current user informations'

    type Types::UserType, null: true

    def resolve
      authorize! current_user || User.new, to: :me?
      current_user
    end
  end
end
