class PagesController < ApplicationController
  layout 'layouts/landingpage'
  def index
  end

  def about_us
  end

  def blog
    @posts = Post.published.by_date
  end
end
