class TicketPolicy < ApplicationPolicy
  attr_reader :user, :ticket

  def initialize user, ticket
    @user = user
    @ticket = ticket
  end

  def create?
    user.present? && user.customer?
  end

  def update?
    user.present? &&
      user.agent?
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      user.agent? ? scope : scope.by_user(user)
    end
  end
end
