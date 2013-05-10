class PostsController < ApplicationController
  respond_to :json, except: %i(new edit)

  before_action only: [:create, :update] do
    params[:post] = params.require(:post).permit(:text, :url)
  end
  load_and_authorize_resource except: :index

  # GET /posts
  # GET /posts.json
  def index
    @q = Post.includes(:user, :comments).search(params[:q])
    @posts = @q.result(:distinct => true)
    respond_with @posts
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    respond_with @post
  end

  # GET /posts/new
  def new
    respond_with @post
  end

  # GET /posts/1/edit
  def edit
    respond_with @post
  end

  # POST /posts
  # POST /posts.json
  def create
    flash.notice = I18n.t("helpers.notices.created", model: Post.model_name.human) if @post.save
    respond_with @post
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    flash.notice = I18n.t("helpers.notices.updated", model: Post.model_name.human) if @post.save
    respond_with @post
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    flash.notice = I18n.t("helpers.notices.destroyed", model: Post.model_name.human)
    respond_with @post
  end
end
