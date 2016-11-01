require 'rails_helper'

describe 'layouts/application', type: :view do
  context 'when authenticated' do
    before do
      sign_in create :user
    end

    it "has 'Sign out' link" do
      render

      expect(rendered).to have_css \
        "a[href='#{destroy_user_session_path}'][data-method='delete']",
        text: 'Sign out'
    end
  end

  context 'when anonymous' do
    it "has no 'Sign out' link" do
      render

      expect(rendered).not_to have_css 'a', text: 'Sign out'
    end
  end
end
