require 'rails_helper'

describe TicketsController, type: :controller do
  let(:user) { create :user }
  let(:agent) { create :user, role: :agent }
  describe '#new' do
    context 'when authenticated' do
      before { sign_in user }

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
      before { sign_in user }

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

      context 'when posting empty form' do
        it 'does not create a ticket' do
          post :create,
            params: {
              ticket: {
                title: '',
                description: ''
              }
            }

          expect(response).to have_http_status :ok
          expect(Ticket.count).to eq 0
        end
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

  describe '#update' do
    let(:ticket) { create :ticket, user: user }

    before { sign_in agent }

    it 'allows to take tickets' do
      patch :update, params: { id: ticket.id, event: :take }

      expect(ticket.reload).to be_in_progress
    end

    it 'ignores invalid events' do
      patch :update, params: { id: ticket.id, event: :invalid }

      expect(ticket.reload).to be_open
    end
  end
end
