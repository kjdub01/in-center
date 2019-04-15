class ApplicationController < ActionController::Base
  before_action :current_user
  before_action :require_login, except: [:new, :create, :home]
  before_action :set_timezone

  def logged_in?
    !!current_user
  end

  private

  def authorized_to_edit_user
    unless admin || current_user == @user
      redirect_to user_path(current_user)
    end
  end

  def set_timezone
    Time.zone = 'GMT'
  end

  def require_login
    redirect_to root_path unless logged_in?
  end

  def require_admin
    redirect_to user_path(current_user) unless admin
  end
  helper_method :require_admin

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def admin
    current_user.admin
  end
  helper_method :admin
end
