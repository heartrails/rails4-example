class UsersController < ApplicationController
  respond_to :json, except: %i(new edit)

  before_action only: [:create, :update] do
    params[:user] = params.require_hash(:user).permit(:username, :password, :password_confirmation)
  end
  load_and_authorize_resource

  # GET /users/1
  # GET /users/1.json
  def show
    respond_with @user
  end

  # GET /users/new
  def new
    respond_with @user
  end

  # GET /users/1/edit
  def edit
    respond_with @user
  end

  # POST /users
  # POST /users.json
  def create
    if @user.save
      flash.notice = I18n.t("helpers.notices.created", model: User.model_name.human)
      session[:user_id] = @user.id
    end
    respond_with @user
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    I18n.t("helpers.notices.updated", model: User.model_name.human)  if @user.save
    respond_with @user
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    flash.notice = I18n.t("helpers.notices.destroyed", model: User.model_name.human)
    respond_with @user, location: root_url
  end
end
