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

    @posts = @posts.page(params[:page]).per(15)
  end

  def news
    @news = News.all
    @search = params[:term]

    if @search = params[:term]
      @news = @news.serach(@search)
    end
    @news = @news.page(params[:page]).per(15)
  end

  private
end
