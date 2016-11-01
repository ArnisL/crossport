require 'rails_helper'

describe 'tickets/new', type: :view do
  it 'has new ticket form' do
    render

    expect(rendered).to have_css 'form#new_ticket'
    expect(rendered).to have_css 'input#ticket_title'
    expect(rendered).to have_css 'input#ticket_description'
    expect(rendered).to have_css \
      "form#new_ticket input[type='submit'][value='Open ticket']"
  end
end
