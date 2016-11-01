require 'rails_helper'

describe 'application/show', type: :view do
  context 'when authenticated' do
    before { sign_in create :user }

    it "has 'Open ticket' link" do
      render

      expect(rendered).to have_css "a[href='#{new_ticket_path}']",
        text: 'Open ticket'
    end

    it "has title 'Support tickets'" do
      render

      expect(view.content_for :title).to have_content 'Support tickets'
    end

    context 'and customer has no tickets' do
      it "tickets table has info row stating 'You have no tickets'" do
        render

        expect(rendered).to have_css '#tickets tr.info td', text: 'You have no tickets'
      end
    end
  end
end
