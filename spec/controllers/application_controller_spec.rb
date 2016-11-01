require 'rails_helper'

describe ApplicationController, type: :controller do
  describe '#show' do
    context 'when anonymous' do
      it 'redirects unsigned user to registration page' do
        get :show

        expect(response).to redirect_to new_user_session_path
      end
    end

    context 'when authenticated' do
      let(:user) { create :user }
      before { sign_in user }

      it 'assigns @tickets' do
        create_list :ticket, 12, user: user

        get :show, params: { page: 2 }

        expect(assigns(:tickets)).to eq user.tickets.last(2)
      end
    end
  end
end
