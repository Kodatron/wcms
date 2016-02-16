class AdminController < ApplicationController
  layout 'layouts/admin'
  before_action :check_admin

  def index
  end

  def blog
    @posts = Post.all
    @search = params[:term]

    if @search
      @posts = @posts.search(@search)
    end

    @posts = paginate(@posts)
  end

  def news
    @news = News.all
    @search = params[:term]

    if @search = params[:term]
      @news = @news.serach(@search)
    end
    @news = paginate(@news)
  end

  def users
    @users = User.all.includes(:profile)
    @users = paginate(@users)
  end

  private
  def paginate collection
    @collection = collection.page(params[:page]).per(15)
  end
end
