class UsersController < ApplicationController
  respond_to :json, except: %i(new edit)

  before_action only: [:create, :update] do
    params[:user] = params.require_hash(:user).permit(:username, :password, :password_confirmation)
  end
  load_and_authorize_resource

  # show the user
  # * *routes*:
  #   - GET /users/:id (.html)
  #   - GET /users/:id.json
  # * *params* :
  #   - id: ID of the user
  def show
    respond_with @user
  end

  # show new form of a user
  # * *routes*:
  #   - GET /users/new (.html)
  def new
    respond_with @user
  end

  # show edit form of the user
  # * *routes*:
  #   - GET /users/:id/edit (.html)
  # * *params* :
  #   - id: ID of the user
  def edit
    respond_with @user
  end

  # create a user
  # * *routes*:
  #   - POST /users (.html)
  #   - POST /users.json
  # * *params* :
  #   - user.username: username
  #   - user.password: password
  #   - user.password_confirmation: confirmation of the password
  def create
    if @user.save
      flash.notice = I18n.t("helpers.notices.created", model: User.model_name.human)
      session[:user_id] = @user.id
    end
    respond_with @user
  end

  # * *routes*:
  #   - PATCH/PUT /users/:id (.html)
  #   - PATCH/PUT /users/:id.json
  # * *params* :
  #   - id: ID of the user
  #   - user.username: username
  #   - user.password: password
  #   - user.password_confirmation: confirmation of the password
  def update
    I18n.t("helpers.notices.updated", model: User.model_name.human)  if @user.save
    respond_with @user
  end

  # delete the user
  # * *routes*:
  #   - DELETE /users/:id (.html)
  #   - DELETE /users/:id.json
  # * *params* :
  #   - id: ID of the user
  def destroy
    @user.destroy
    flash.notice = I18n.t("helpers.notices.destroyed", model: User.model_name.human)
    respond_with @user, location: root_url
  end
end
