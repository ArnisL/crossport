require 'rails_helper'

describe 'application/show', type: :view do
  context 'when authenticated' do
    before { sign_in create :user }

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
