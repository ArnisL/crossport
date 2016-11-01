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
end
