require 'rails_helper'

describe TicketPolicy do
  subject { described_class }
  let(:customer) { create(:user, role: :customer) }
  let(:agent) { create(:user, role: :agent) }
  let(:ticket) { create(:ticket, user: customer) }

  permissions :create? do
    it 'grants access if customer' do
      expect(subject).to permit(customer, Ticket)
    end

    it 'denies access if agent' do
      expect(subject).not_to permit(agent, Ticket)
    end

    it 'denies access if unauthenticated' do
      expect(subject).not_to permit(nil, Ticket)
    end
  end

  permissions :update? do
    it 'grants access if agent' do
      expect(subject).to permit(agent, ticket)
    end

    it 'denies access if customer' do
      expect(subject).not_to permit(customer, ticket)
    end

    it 'denies access if unauthenticated' do
      expect(subject).not_to permit(nil, ticket)
    end
  end

  describe '.scope' do
    let(:agent) { create :user, role: :agent}
    let(:customer) { create :user, role: :customer}
    before do
      create :ticket, user: customer
      create :ticket, user: create(:user)
    end

    it 'contains all if agent' do
      expect(Pundit.policy_scope(agent, Ticket).all).to match_array Ticket.all
    end

    it 'contains owned if customer' do
      expect(Pundit.policy_scope(customer, Ticket).all).to match_array customer.tickets
    end
  end
end
