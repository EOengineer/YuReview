class SessionsController < ApplicationController
  skip_before_action :authenticate

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to movies_path
      flash[:success] = "You've Signed In!"
    else
      flash[:alert] = "Email or Password Invalid."
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:now] = "Successfully Signed Out."
    redirect_to signin_path
  end
end
