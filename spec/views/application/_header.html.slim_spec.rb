require 'rails_helper'

describe 'application/_header', type: :view do
  it 'has brand link that redirects to root path' do
    render

    expect(rendered).to have_css \
      ".navbar-header .navbar-brand[href='#{root_path}']",
      text: 'CrossPort'
  end
end
