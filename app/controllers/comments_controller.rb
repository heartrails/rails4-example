class CommentsController < ApplicationController
  respond_to :json, except: %i(new edit)

  before_action only: [:create, :update] do
    params[:comment] = params.require_hash(:comment).permit(:body)
    params[:comment][:post_id] = params[:post_id] if action_name == 'create'
  end
  load_and_authorize_resource :post
  load_and_authorize_resource

  # show the comment
  # * *routes*:
  #   - GET /comments/:id (.html)
  #   - GET /comments/:id.json
  # * *params* :
  #   - id: ID of the comment
  def show
    respond_with @comment
  end

  # show new form of a comment
  # * *routes*:
  #   - GET /comments/new (.html)
  def new
    respond_with @comment
  end

  # show edit form of the comment
  # * *routes*:
  #   - GET /comments/:id/edit (.html)
  # * *params* :
  #   - id: ID of the comment
  def edit
    respond_with @comment
  end

  # create a comment belongs to the post
  # * *routes*:
  #   - POST /comments (.html)
  #   - POST /comments.json
  # * *params* :
  #   - post_id: ID of the post
  #   - comment.body: comment's body
  def create
    flash.notice = I18n.t("helpers.notices.created", model: Comment.model_name.human) if @comment.save
    respond_with @comment, location: @comment.post
  end

  # update the comment
  # * *routes*:
  #   - PATCH/PUT /comments/:id (.html)
  #   - PATCH/PUT /comments/:id.json
  # * *params* :
  #   - id: ID of the comment
  #   - comment.body: comment's body
  def update
    flash.notice = I18n.t("helpers.notices.updated", model: Comment.model_name.human) if @comment.save
    respond_with @comment, location: @comment.post
  end

  # delete the comment
  # * *routes*:
  #   - DELETE /comments/:id (.html)
  #   - DELETE /comments/:id.json
  # * *params* :
  #   - id: ID of the comment
  def destroy
    @comment.destroy
    flash.notice = I18n.t("helpers.notices.destroyed", model: Comment.model_name.human)
    respond_with @comment, location: @comment.post
  end
end
