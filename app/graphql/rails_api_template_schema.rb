# frozen_string_literal: true

# GraphQL API configuration
class RailsApiTemplateSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)

  # prevent clients from asking for too vast collection
  default_max_page_size 20

  # ensure type is valid in case of union
  def self.resolve_type(type, _obj, _ctx)
    type
  rescue NameError
    raise GraphQL::ExecutionError, "Unexpected object : #{type}"
  end

  # Build UniqueWithinType ID by joining the type name & ID, then base64-encoding it
  def self.id_from_object(object, type_definition, _query_ctx)
    GraphQL::Schema::UniqueWithinType.encode(type_definition.graphql_name, object.id)
  end

  # Find object base on based on `type_name` and `item_id` from uwt_id
  def self.object_from_id(uwt_id, _query_ctx)
    type_name, item_id = GraphQL::Schema::UniqueWithinType.decode(uwt_id)
    type_name.constantize.find item_id
  end

  # format authorization errors
  rescue_from ActionPolicy::Unauthorized do |err|
    raise GraphQL::ExecutionError.new(
      # use result.message (backed by i18n) as an error message
      err.result.message,
      extensions: {
        # use GraphQL error extensions to provide more context
        code: 'Unauthorized',
        fullMessages: err.result.reasons.full_messages,
        details: err.result.reasons.details
      }
    )
  end
end
