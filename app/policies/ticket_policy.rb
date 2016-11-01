class TicketPolicy < ApplicationPolicy
  attr_reader :user, :ticket

  def initialize user, ticket
    @user = user
    @ticket = ticket
  end

  def create?
    user.present?
  end
end
