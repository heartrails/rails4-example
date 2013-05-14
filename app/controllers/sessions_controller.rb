class SessionsController < ApplicationController
  # show login form
  # * *routes*:
  #   - GET /sessions/new (.html)
  def new
    @user = User.new
    respond_with @user
  end

  # perform login (= authenticate given username and password)
  # * *routes*:
  #   - POST /sessions (.html)
  # * *params* :
  #   - user.username: username
  #   - user.password: password
  def create
    user_params = params.require_hash(:user)
    user = User.find_by(username: user_params[:username])
    respond_to do |format|
      if user && user.authenticate(user_params[:password])
        reset_session
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

  # perform logout (= discard current session)
  # * *routes*:
  #   - DELETE /sessions (.html)
  def destroy
    reset_session
    respond_to do |format|
      format.html { redirect_to root_url, :notice => "Logged out" }
      format.js   { head :ok }
    end
  end
end
