class UsersController < ApplicationController
  skip_before_action :authenticate

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to movies_path
      flash[:success] = "Sign up successful."
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :admin, :password, :password_confirmation)
  end
end
