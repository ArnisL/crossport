class TicketsController < ApplicationController
  after_action :verify_authorized

  def new
    authorize Ticket
    @ticket = Ticket.new
  end

  def create
    authorize Ticket

    @ticket = Ticket.new create_params
    @ticket.save and
      redirect_to root_path,
        notice: 'Ticket successfully opened!' and return

    render :new
  end

  def update
    @ticket = Ticket.find params[:id]
    authorize @ticket

    @ticket.trigger! params[:event]

    redirect_to root_path
  end

  private

  def create_params
    params.fetch(:ticket)
      .permit(:title, :description)
      .merge(user: current_user)
  end
end
