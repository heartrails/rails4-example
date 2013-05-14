class PostsController < ApplicationController
  respond_to :json, except: %i(new edit)

  before_action only: [:create, :update] do
    params[:post] = params.require_hash(:post).permit(:text, :url)
  end
  load_and_authorize_resource except: :index

  # show list of posts
  # * *routes*:
  #   - GET /posts (.html)
  #   - GET /posts.json
  # * *params* :
  #   - q: Hash of search keys and values (optional)
  def index
    @q = Post.includes(:user, :comments).search(params[:q])
    @posts = @q.result(:distinct => true)
    respond_with @posts
  end

  # show the post
  # * *routes*:
  #   - GET /posts/:id (.html)
  #   - GET /posts/:id.json
  # * *params* :
  #   - id: ID of the post
  def show
    respond_with @post
  end

  # show new form of a post
  # * *routes*:
  #   - GET /posts/new (.html)
  def new
    respond_with @post
  end

  # show edit form of the post
  # * *routes*:
  #   - GET /posts/:id/edit (.html)
  # * *params* :
  #   - id: ID of the post
  def edit
    respond_with @post
  end

  # create a post
  # * *routes*:
  #   - POST /posts (.html)
  #   - POST /posts.json
  # * *params* :
  #   - post.text: post's text
  #   - post.url: post's url
  def create
    flash.notice = I18n.t("helpers.notices.created", model: Post.model_name.human) if @post.save
    respond_with @post
  end

  # update the post
  # * *routes*:
  #   - PATCH/PUT /posts/:id (.html)
  #   - PATCH/PUT /posts/:id.json
  # * *params* :
  #   - id: ID of the post
  #   - post.text: post's text
  #   - post.url: post's url
  def update
    flash.notice = I18n.t("helpers.notices.updated", model: Post.model_name.human) if @post.save
    respond_with @post
  end

  # delete the post
  # * *routes*:
  #   - DELETE /posts/:id (.html)
  #   - DELETE /posts/:id.json
  # * *params* :
  #   - id: ID of the post
  def destroy
    @post.destroy
    flash.notice = I18n.t("helpers.notices.destroyed", model: Post.model_name.human)
    respond_with @post
  end
end
