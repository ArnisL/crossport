require 'rails_helper'

describe "application/_progress", type: :view do
  it 'shows progress bar of all ticket status if agent' do
    user = create :user, role: :agent
    sign_in user

    create :ticket, status: :open, user: user
    create :ticket, status: :open, user: user
    create :ticket, status: :in_progress, user: user
    create :ticket, status: :finished, user: user
    @all_tickets = Ticket.all
    
    render

    expect(rendered).to have_css ".progress-bar-danger[style='width: 50.0%']"
    expect(rendered).to have_css ".progress-bar-primary[style='width: 25.0%']"
    expect(rendered).to have_css ".progress-bar-success[style='width: 25.0%']"
  end

  it 'is hidden if customer' do
    sign_in create :user, role: :customer
    @all_tickets = Ticket.all

    render

    expect(rendered).not_to have_css '.progress.tickets'
  end
end
