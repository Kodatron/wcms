class PostsController < ApplicationController
  layout 'layouts/landingpage'
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :increase_views, only: :show
  before_filter :check_admin, only: [:new, :edit, :update, :create, :destroy]

  def index
    @posts = Post.published.by_date
  end

  def show
  end

  def new
    @post = Post.new
    render layout: 'layouts/admin'
  end

  def edit
    render layout: 'layouts/admin'
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to admin_blog_path, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render layout: 'layouts/admin', action: :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to admin_blog_path, notice: resource_updated_flash }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def change_status
    @post = Post.find(params[:post_id])
    if @post.draft?
      @post.published!
    else
      @post.draft!
    end
    redirect_to admin_blog_path, notice: "Status has been updated!"
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to admin_blog_path, notice: 'Post was successfully destroyed.' }
    end
  end

  private

    def increase_views
      @post.increment!(:views)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :status, :user_id, :published_at)
    end
end
