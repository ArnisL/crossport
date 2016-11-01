require 'rails_helper'

describe 'tickets/new', type: :view do
  it 'has new ticket form' do
    @ticket = Ticket.new

    render

    expect(rendered).to have_css 'form#new_ticket'
    expect(rendered).to have_css 'input#ticket_title'
    expect(rendered).to have_css 'input#ticket_description'
    expect(rendered).to have_css \
      "form#new_ticket input[type='submit'][value='Open ticket']"
  end

  it 'shows ticket errors' do
    @ticket = Ticket.new
    @ticket.valid?

    render

    expect(rendered).to have_css '.has-error input#ticket_title'
    expect(rendered).to have_css '.has-error input#ticket_description'
  end
end
