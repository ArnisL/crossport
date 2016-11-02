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
end
