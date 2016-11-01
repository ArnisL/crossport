require 'rails_helper'

describe 'layouts/application', type: :view do
  describe "'Sign out' link" do
    context 'when authenticated' do
      before do
        sign_in create :user
      end

      it 'is displayed' do
        render

        expect(rendered).to have_css \
          "a[href='#{destroy_user_session_path}'][data-method='delete']",
          text: 'Sign out'
      end
    end

    context 'when anonymous' do
      it 'is hidden' do
        render

        expect(rendered).not_to have_css 'a', text: 'Sign out'
      end
    end
  end

  describe 'notifications' do
    it 'can show notice' do
      flash[:notice] = 'Thank you and have a nice day!'

      render

      expect(rendered).to have_css '.alert',
        text: 'Thank you and have a nice day!'
    end
  end
end
