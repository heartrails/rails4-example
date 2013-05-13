class CommentsController < ApplicationController
  respond_to :json, except: %i(new edit)

  before_action only: [:create, :update] do
    params[:comment] = params.require_hash(:comment).permit(:body)
    params[:comment][:post_id] = params[:post_id] if params[:action] == 'create'
  end
  load_and_authorize_resource :post
  load_and_authorize_resource

  # GET /comments/1
  # GET /comments/1.json
  def show
    respond_with @comment
  end

  # GET /comments/new
  def new
    respond_with @comment
  end

  # GET /comments/1/edit
  def edit
    respond_with @comment
  end

  # POST /comments
  # POST /comments.json
  def create
    flash.notice = I18n.t("helpers.notices.created", model: Comment.model_name.human) if @comment.save
    respond_with @comment, location: @comment.post
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    flash.notice = I18n.t("helpers.notices.updated", model: Comment.model_name.human) if @comment.save
    respond_with @comment, location: @comment.post
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    flash.notice = I18n.t("helpers.notices.destroyed", model: Comment.model_name.human)
    respond_with @comment, location: @comment.post
  end
end
