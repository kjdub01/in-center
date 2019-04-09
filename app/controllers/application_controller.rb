class ApplicationController < ActionController::Base
  before_action :current_user
  before_action :require_login, except: [:new, :create, :home]
  before_action :set_timezone

  def logged_in?
    !!current_user
  end

  private

  def set_timezone
    Time.zone = 'GMT'
  end

  def require_login
    redirect_to root_path unless logged_in?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
