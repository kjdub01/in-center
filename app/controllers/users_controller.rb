class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id

      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :name,
      :phone,
      :address1,
      :address2,
      :city,
      :state,
      :zipcode,
      :email,
      :password,
      :admin
    )
  end

end
