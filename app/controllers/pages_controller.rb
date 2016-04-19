class PagesController < ApplicationController
  layout 'layouts/landingpage'
  before_action :login_required, only: :dashboard
  before_action :init_api, only: :guild

  def index
  end

  def about_us
  end

  def guild
    @guild = @wow.get_simple_guild_profile("Grim Batol", "Family Legion")
  end

  def dashboard
    render layout: 'layouts/application'
  end

  def blog
    @posts = Post.published.by_date
  end
end
