class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  def show
    redirect_to new_user_registration_path unless signed_in?
  end
end
