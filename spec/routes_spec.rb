require 'rails_helper'

describe 'Routes', type: :routing do
  it '/ to application#show' do
    expect(get: '/').to route_to(
      controller: 'application',
      action: 'show'
    )
  end

  it '/tickets/new to tickets#new' do
    expect(get: '/tickets/new').to route_to(
      controller: 'tickets',
      action: 'new'
    )
  end
end
