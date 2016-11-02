require 'rails_helper'

describe User do
  it { should have_many :tickets }
  it { should have_enum role: %w{customer agent admin} }
end
