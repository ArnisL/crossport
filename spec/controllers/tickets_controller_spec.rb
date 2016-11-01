require 'rails_helper'

describe TicketsController, type: :controller do
  describe '#new' do
    context 'when authenticated' do
      before { sign_in create :user }

      it 'initializes new ticket' do
        get :new

        expect(response).to have_http_status :ok
        expect(assigns(:ticket)).to be_a_new(Ticket)
      end
    end

    context 'when anonymous' do
      it 'denies access' do
        get :new

        expect(response).to have_http_status :redirect
        expect(assigns(:ticket)).to eq nil
      end
    end
  end

  describe '#create' do
    context 'when authenticated' do
      before { sign_in create :user }

      it 'creates new ticket' do
        ticket = build :ticket

        post :create,
          params: {
            ticket: {
              title: ticket.title,
              description: ticket.description
            }
          }

        expect(response).to have_http_status :redirect
        expect(Ticket.count).to eq 1
        expect(flash[:notice]).to eq 'Ticket successfully opened!'
      end
    end

    context 'when anonymous' do
      it 'denies access' do
        post :create

        expect(response).to have_http_status :redirect
        expect(Ticket.count).to eq 0
      end
    end
  end
end
