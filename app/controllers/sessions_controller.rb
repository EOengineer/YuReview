class SessionsController < ApplicationController


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
end
