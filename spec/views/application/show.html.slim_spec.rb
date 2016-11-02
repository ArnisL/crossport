require 'rails_helper'

describe 'application/show', type: :view do
  let(:user) { create :user }
  before do
    @all_tickets = user.tickets
    @tickets = user.tickets.page(1).per(10)
    sign_in user
  end

  it "has title 'Support tickets'" do
    render

    expect(view.content_for :title).to have_content 'Support tickets'
  end

  it "has 'Open ticket' link" do
    render

    expect(rendered).to have_css "a[href='#{new_ticket_path}']",
      text: 'Open ticket'
  end

  context 'when customer has no tickets' do
    it "tickets table has info row stating 'You have no tickets'" do
      render

      expect(rendered).to have_css '#tickets tr.info td', text: 'You have no tickets'
      column_count = Nokogiri.parse(rendered).css('#tickets th').count
      expect(rendered).to have_css "#tickets tr.info td[colspan='#{column_count}']"
    end
  end

  context 'when customer opens a ticket' do
    let(:ticket) { create :ticket, status: :open, user: user}
    before { user.tickets << ticket }

    it 'has it on tickets table' do
      render

      expect(rendered).to have_css '#tickets td.index', text: '1'
      expect(rendered).to have_css '#tickets td.title', text: ticket.title
      expect(rendered).to have_css '#tickets td.status', text: ticket.status.humanize
    end

    it 'customer has no option to Take it' do
      render

      expect(rendered).not_to have_css '#tickets td.actions .btn', text: 'Take'
    end
  end

  context 'when authenticated as agent' do
    let(:agent) { create :user, role: :agent }
    let(:ticket) { user.tickets.last }
    before { sign_in agent }

    it "hides 'Open ticket' button" do
      render

      expect(rendered).not_to have_css 'a.btn', text: 'Open ticket'
    end

    context 'and customer has opened a ticket' do
      before { user.tickets << create(:ticket, status: :open, user: user) }
      it 'offers to Take it' do
        render

        path = ticket_path(user.tickets.last, event: :take)

        selector = "#tickets td.actions .btn[data-method='patch'][href='#{path}']"

        expect(rendered).to have_css selector, text: 'Take'
      end

      it 'shows which customer has opened ticket' do
        render

        expect(rendered).to have_css '#tickets td.opened_by', text: ticket.user.email
        expect(rendered).to have_css '#tickets td.opened_by img.thumbnail'
      end
    end

    context 'and have taken a ticket' do
      before { user.tickets << create(:ticket, status: :in_progress, user: user) }
      it 'offers to Finish it' do
        render

        path = ticket_path(user.tickets.last, event: :finish)

        selector = "#tickets td.actions .btn[data-method='patch'][href='#{path}']"

        expect(rendered).to have_css selector, text: 'Finish'
      end
    end
  end
end
