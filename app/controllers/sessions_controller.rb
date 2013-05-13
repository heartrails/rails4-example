class SessionsController < ApplicationController
  def new
    @user = User.new
    respond_with @user
  end

  def create
    user_params = params.require_hash(:user)
    user = User.find_by(username: user_params[:username])
    respond_to do |format|
      if user && user.authenticate(user_params[:password])
        session[:user_id] = user.id
        format.html { redirect_to root_url, :notice => "Logged in" }
        format.js   { head :ok }
      else
        format.html {
          flash.now[:alert] = "ログインできません。"
          @user = User.new(user_params.permit(:username))
          render "new"
        }
        format.js { head :unauthorized }
      end
    end
  end

  def destroy
    reset_session
    respond_to do |format|
      format.html { redirect_to root_url, :notice => "Logged out" }
      format.js   { head :ok }
    end
  end
end
