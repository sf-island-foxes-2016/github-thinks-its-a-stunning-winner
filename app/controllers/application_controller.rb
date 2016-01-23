class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to '/login' unless admin?
  end

  def admin?
    current_user && current_user.title == "admin"
  end
  helper_method :admin?

  def login_check
    redirect_to '/login' unless current_user
  end
  helper_method :login_check


end
