class PostsController < ApplicationController
  layout 'layouts/admin'
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
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to admin_blog_path, notice: 'Your post was successfully created.'
    else
      render status: 402, action: :new
    end
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "Updated #{@post.title}."
      redirect_to admin_blog_path
    else
      render status: 402, action: :edit
    end
  end

  def change_status
    @post = Post.find(params[:post_id])
    if @post.draft?
      @post.published!
    else
      @post.draft!
    end
    flash[:neutral] = "Status has been changed to #{@post.status}"
    redirect_to admin_blog_path
  end

  def destroy
    if @post.destroy
      flash[:warning] = "#{@post.name} was permanently destroyed"
      redirect_to admin_blog_path
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
