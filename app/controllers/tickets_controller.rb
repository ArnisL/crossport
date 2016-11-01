class TicketsController < ApplicationController
  after_action :verify_authorized

  def new
    authorize Ticket
    @ticket = Ticket.new
  end

  def create
    authorize Ticket

    @ticket = Ticket.new create_params
    if @ticket.save
      redirect_to root_path, notice: 'Ticket successfully opened!'
    else
      flash[:error] = 'Ticket is invalid!'
      render :new
    end
  end

  private

  def create_params
    params.fetch(:ticket)
      .permit(:title, :description)
      .merge(user: current_user)
  end
end
