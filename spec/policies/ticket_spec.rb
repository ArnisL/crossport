require 'rails_helper'

describe TicketPolicy do
  subject { described_class }

  permissions :create? do
    it 'grants access if authenticated' do
      expect(subject).to permit(Ticket, create(:user))
    end

    it 'denies access if unauthenticated' do
      expect(subject).not_to permit(nil, Ticket)
    end
  end
end
