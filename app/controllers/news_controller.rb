class NewsController < ApplicationController
  layout 'layouts/admin'
  before_action :set_news, only: [:show, :edit, :update, :destroy]
  before_action :increase_views, only: :show
  before_filter :check_admin, only: [:new, :edit, :update, :create, :destroy]

  def index
    @news = News.all
    render layout: 'layouts/landingpage'
  end

  def show
    render layout: 'layouts/landingpage'
  end

  def new
    @news = News.new
  end

  def edit
  end

  def create
    @news = News.new(news_params)
    if @news.save
      redirect_to admin_news_path, notice: "#{@news.title} was successfully created."
    else
      render status: 402, action: :new
    end
  end

  def update
    if @news.update(news_params)
      redirect_to admin_news_path, notice: "You have successfully updated #{@news.title} ."
    else
      render status: 402, action: :edit
    end
  end

  def destroy
    if @news.destroy
      flash[:warning] = "You have destroyed #{@news.title}."
      redirect_to admin_news_path
    end
  end

  def change_status
    @news = News.find(params[:news_id])

    @interactor = ChangeStatus.call(
      document: @news,
      status: params[:status]
    )
    unless @interactor.success?
      redirect_to admin_news_path, alert: "Something went wrong.."
    else
      redirect_to admin_news_path, notice: "Status has been updated to #{@news.status.capitalize}"
    end
  end

  private
    def increase_views
      @news.increment!(:views)
    end

    def set_news
      @news = News.find(params[:id])
    end

    def news_params
      params.require(:news).permit(:title, :body, :status, :permissions)
    end
end
