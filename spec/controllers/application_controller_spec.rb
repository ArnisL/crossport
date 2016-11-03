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

      it 'calls search with q param' do
        create :ticket, title: 'find it', description: 'x', user: user
        create :ticket, title: 'x', description: 'find it', user: user
        create :ticket, title: 'x', description: 'x', user: user

        get :show, params: { q: 'find it' }

        expect(assigns(:all_tickets).count).to eq 2
      end
    end
  end
end
