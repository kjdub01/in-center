class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save

    else
      render "new"
    end 
  end

  private

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
