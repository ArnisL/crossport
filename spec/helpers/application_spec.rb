require 'rails_helper'

describe ApplicationHelper do
  describe '#flash_class' do
    it 'translates rails flash key to bootstrap css class' do
      expect(helper.flash_class :success).to eq 'alert-success'
      expect(helper.flash_class 'error').to eq 'alert-danger'
      expect(helper.flash_class 'alert').to eq 'alert-warning'
      expect(helper.flash_class :notice).to eq 'alert-info'
    end

    it 'returns same key when translation is missing' do
      expect(helper.flash_class :iNvAlId).to eq 'iNvAlId'
    end
  end

  describe '#gravatar_url' do
    it 'returns gravatar url' do
      expect(helper.gravatar_url('arnis.lapsa@gmail.com', 100)).to eq \
        "http://gravatar.com/avatar/5dd2e053a2410fdb27cdf0dff9c64266.png?s=100"
    end
  end

  describe '#status_css' do
    it 'returns according bootstrap css class for coloring by ticket status' do
      expect(helper.status_css(:open)).to eq 'label-danger'
      expect(helper.status_css('in_progress')).to eq 'label-primary'
      expect(helper.status_css(:finished)).to eq 'label-success'
    end
  end
end
