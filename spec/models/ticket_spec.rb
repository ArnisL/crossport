require 'rails_helper'

describe Ticket do
  it { should be_open }
  it { should belong_to :user }
end
