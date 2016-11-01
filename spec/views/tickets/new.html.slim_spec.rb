require 'rails_helper'

describe 'tickets/new', type: :view do
  before { @ticket = Ticket.new }

  it 'has new ticket form' do
    render

    expect(rendered).to have_css 'form#new_ticket'
    expect(rendered).to have_css 'input#ticket_title'
    expect(rendered).to have_css 'textarea#ticket_description'
    expect(rendered).to have_css \
      "form#new_ticket input[type='submit'][value='Open ticket']"
  end

  it 'shows ticket errors' do
    @ticket.valid?

    render

    expect(rendered).to have_css '.has-error input#ticket_title'
    expect(rendered).to have_css '.has-error textarea#ticket_description'
  end

  it 'has description text area with 10 rows' do
    render

    expect(rendered).to have_css "textarea#ticket_description[rows='10']"
  end
end
