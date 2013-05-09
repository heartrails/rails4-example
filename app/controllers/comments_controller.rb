class CommentsController < ApplicationController
  before_action only: [:create, :update] do
    params[:comment] = params.require(:comment).permit(:body)
    params[:comment][:post_id] = params[:post_id] if params[:action] == 'create'
  end
  load_and_authorize_resource :post
  load_and_authorize_resource

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.post, notice: 'Comment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @comment }
      else
        format.html { render action: 'new' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.post, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to post_comments_url(@comment.post) }
      format.json { head :no_content }
    end
  end
end
