class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def show
    unless signed_in?
      redirect_to new_user_session_path and return
    end

    @all_tickets = policy_scope(Ticket.all).search(params[:q])

    @tickets = @all_tickets.page(params[:page]).per(10)
  end

  def monthly_report
    authorize Ticket, :monthly_report?
    @tickets = policy_scope(Ticket.finished.last_month)

    respond_to do |format|
      format.html
      format.pdf do
        render layout: false, pdf: 'monthly_report'
      end
    end
  end

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to request.referrer || root_path
  end
end
