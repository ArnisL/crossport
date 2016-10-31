require 'rails_helper'

describe 'application/show', type: :view do
  context 'when authenticated' do
    before do
      sign_in User.create email: 'arnis.lapsa@gmail.com',
        password: '123123', password_confirmation: '123123'
    end

    it "has 'Open ticket' link" do
      render

      expect(rendered).to have_css "a[href='#{new_ticket_path}']",
        text: 'Open ticket'
    end
  end

  context 'when anonymous' do
    it "has no 'Open ticket' link" do
      render

      expect(rendered).not_to have_css 'a', text: 'Open ticket'
    end
  end
end
