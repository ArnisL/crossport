require 'rails_helper'

describe 'Routes', type: :routing do
  it 'get / to application#show' do
    expect(get: '/').to route_to(
      controller: 'application',
      action: 'show'
    )
  end

  it 'get /tickets/new to tickets#new' do
    expect(get: '/tickets/new').to route_to(
      controller: 'tickets',
      action: 'new'
    )
  end

  it 'post /tickets to tickets#create' do
    expect(post: '/tickets').to route_to(
      controller: 'tickets',
      action: 'create'
    )
  end
end
