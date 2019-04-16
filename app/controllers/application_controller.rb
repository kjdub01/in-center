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
      flash[:danger] = "You cannot edit this"
      redirect_to user_path(current_user)
    end
  end

  def set_timezone
    Time.zone = 'GMT'
  end

  def require_login
    unless logged_in?
      flash[:danger] = "Login First"
      redirect_to login_path
    end
  end

  def require_admin
    flash[:danger] = "You must be an admin to do that."
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
