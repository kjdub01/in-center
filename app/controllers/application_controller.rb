class ApplicationController < ActionController::Base
  before_action :current_user
  before_action :require_login, except: [:new, :create, :home]

  def logged_in?
    !!curent_user
  end

  private

  def required_login
    redirect_to root_path unless logged_in?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
