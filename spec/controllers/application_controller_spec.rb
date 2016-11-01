require 'rails_helper'

describe ApplicationController, type: :controller do
  describe '#show' do
    it 'redirects unsigned user to registration page' do
      get :show

      expect(response).to redirect_to new_user_session_path
    end
  end
end
