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

  it 'patch /tickets/1 to tickets#update' do
    expect(patch: '/tickets/1').to route_to(
      controller: 'tickets',
      action: 'update',
      id: '1'
    )
  end

  it 'get /monthly_report to application#monthly_report' do
    expect(get: '/monthly_report').to route_to(
      controller: 'application',
      action: 'monthly_report'
    )
  end
end
