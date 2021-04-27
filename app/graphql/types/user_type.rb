# frozen_string_literal: true

module Types
  class UserType < Types::BaseModelType
    description 'User model datas'

    global_id_field :id

    field :created_at, GraphQL::Types::ISO8601DateTime,
          description: 'object creation date', null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime,
          description: 'object last update date', null: false

    field :email, String, description: 'email', null: true, authorize_field: true
  end
end
