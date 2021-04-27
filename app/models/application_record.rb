# frozen_string_literal: true

# Shared ActiveRecord helpers
class ApplicationRecord < ActiveRecord::Base
  # == Constants ===============================================================

  self.abstract_class = true

  # == Attributes ==============================================================
  # == Extensions ==============================================================
  # == Relationships ===========================================================
  # == Validations =============================================================
  # == Scopes ==================================================================
  # == Callbacks ===============================================================
  # == State Machine ===========================================================
  # == Class Methods ===========================================================

  def self.uwt_id(id)
    GraphQL::Schema::UniqueWithinType.encode(to_s, id)
  end

  def self.id(uwt_id)
    return unless uwt_id

    type_name, item_id = GraphQL::Schema::UniqueWithinType.decode(uwt_id)
    raise ActiveRecord::RecordNotFound, 'invalid uwt_id' unless name == type_name

    item_id
  end

  def self.uwt_ids_to_ids(array_of_uwt_ids)
    return unless array_of_uwt_ids.is_a? Array

    array_of_uwt_ids.map { |uwt_id| id(uwt_id) }
  end

  def self.find_by_uwt_id(uwt_id)
    type_name, item_id = GraphQL::Schema::UniqueWithinType.decode(uwt_id)
    return nil unless name == type_name

    find_by id: item_id
  end

  def self.find_by_uwt_id!(uwt_id)
    type_name, item_id = GraphQL::Schema::UniqueWithinType.decode(uwt_id)
    raise ActiveRecord::RecordNotFound, 'invalid uwt_id' unless name == type_name

    find item_id
  end

  # == Instance Methods ========================================================

  def uwt_id
    GraphQL::Schema::UniqueWithinType.encode(self.class.name, id)
  end
end
