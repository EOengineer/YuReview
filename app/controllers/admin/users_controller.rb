class Admin::UsersController < ApplicationController
  # before_action :admin_authenticate

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:now] = "User successfully updated"
      redirect_to admin_users_url
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :admin, :password, :password_confirmation)
  end
end
