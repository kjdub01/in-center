class SessionsController < ApplicationController
  def new
  end

  def create
    if auth_hash = request.env["omniauth.auth"]
      @user = User.find_or_create_by_omniauth(auth_hash)
      session[:user_id] = @user.id
      flash[:success] = "Welcome!"

      redirect_to user_path(@user)
    else
      @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        flash[:success] = "Welcome!"

        redirect_to user_path(@user)
      else
        flash[:error] = @user.errors.full_messages.to_sentence
        render "sessions/new"
      end
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = "You're Logged Out"
    redirect_to root_path
  end

  private

  def auth
    request.env[ 'omniauth.auth']
  end
end
