require 'rails_helper'

describe 'application/_header', type: :view do
  it 'has brand link that redirects to root path' do
    render

    expect(rendered).to have_css \
      ".navbar-header .navbar-brand[href='#{root_path}']",
      text: 'CrossPort'
  end

  it 'has sign out link if authenticated' do
    render
    expect(rendered).not_to have_css 'navbar-right a', text: 'Sign out'

    sign_in create :user

    render
    expect(rendered).to have_css '.navbar-right a', text: 'Sign out'
  end

  it 'has user email if authenticated' do
    render
    expect(rendered).not_to have_css '.navbar-right .email'

    user = create :user
    sign_in user

    render
    expect(rendered).to have_css '.navbar-right .email.text-muted', text: user.email
  end
end
