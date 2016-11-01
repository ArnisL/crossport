class TicketsController < ApplicationController
  after_action :verify_authorized

  def new
    authorize Ticket
    @ticket = Ticket.new
  end

  def create
    authorize Ticket

    Ticket.create \
      params.require(:ticket)
        .permit(:title, :description)
        .merge(user: current_user)

    redirect_to root_path, notice: 'Ticket successfully opened!'
  end
end
