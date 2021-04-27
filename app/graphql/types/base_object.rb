# frozen_string_literal: true

module Types
  # Base class for GraphQL Types
  class BaseObject < GraphQL::Schema::Object
    include ActionPolicy::GraphQL::Behaviour
    ActionPolicy::GraphQL.authorize_raise_exception = false

    edge_type_class(Types::BaseEdge)
    connection_type_class(Types::BaseConnection)
    field_class Types::BaseField

    def current_user
      context[:current_user]
    end
  end
end
