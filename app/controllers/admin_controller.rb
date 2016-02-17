class AdminController < ApplicationController
  layout 'layouts/admin'
  before_action :check_admin

  def index
    @applications = GuildApplication.pending.count
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
      @news = @news.search(@search)
    end
    @news = paginate(@news)
  end

  def users
    @search = params[:term]
    @users = User.all.includes(:profile)

    if @search
      @users = @users.search(@search)
    end
    @users = paginate(@users)
  end

  def applications
    @applications = GuildApplication.pending
    @applications = paginate(@applications)
  end

  private
  def paginate collection
    @collection = collection.page(params[:page]).per(15)
  end
end
