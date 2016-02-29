class PagesController < ApplicationController
  layout 'layouts/landingpage'
  before_action :login_required, only: :dashboard

  def index
  end

  def about_us
  end

  def dashboard
    render layout: 'layouts/application'
  end

  def blog
    @posts = Post.published.by_date
  end
end
