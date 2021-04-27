# frozen_string_literal: true

# User objects authorisation rules
class UserPolicy < ApplicationPolicy
  def me?
    authenticated? && record == user
  end
end
