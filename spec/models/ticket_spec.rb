require 'rails_helper'

describe Ticket do
  it { should be_open }
  it { should belong_to :user }
  it { should validate_presence_of :title }
  it { should validate_presence_of :description }
end
