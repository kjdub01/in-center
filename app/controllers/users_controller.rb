class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, only: [:destroy]
  before_action :authorized_to_edit_user, only: [:edit]

  def show
  end

  def index
    @users = User.all
  end

  def new
    if current_user
      flash[:danger] = "You cannot create new Users"
      redirect_to user_path(current_user)
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to In Center"

      redirect_to user_path(@user)
    else
      flash[:danger] = @user.errors.full_messages.to_sentence
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Whew! Glad we updated that."
      redirect_to user_path(@user)
    else
      flash[:danger] = @user.errors.full_messages.to_sentence
      render 'edit'
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = "User was deleted."
      redirect_to users_path
    else
      flash[:danger] = @user.errors.full_messages.to_sentence
      redirect_to user_path(@user)
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
