class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate


  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def is_admin?
    @current_user.admin
  end

  helper_method :current_user

  def authenticate
    if current_user.nil?
      flash[:now] = "Not authorized"
      redirect_to signin_path
    end
  end

  def admin_authenticate
    unless is_admin?
      flash[:now] = "You are not a site administrator"
      redirect_to movies_path
    end
  end
end
