class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user_params = params[:user] || {}
    user = User.find_by(username: user_params[:username])
    if user && user.authenticate(user_params[:password])
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Logged in"
    else
      flash.now[:alert] = "ログインできません。"
      @user = User.new(user_params.permit(:username))
      render "new"
    end
  end

  def destroy
    reset_session
    redirect_to root_url, :notice => "Logged out"
  end
end
