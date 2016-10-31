require 'rails_helper'

describe 'Routes', type: :routing do
  it '/ to application#show' do
    expect(get: '/').to route_to(
      controller: 'application',
      action: 'show'
    )
  end
end
