class PagesController < ApplicationController
  def index
    raise ENV['DB_HOST'].inspect
  end
end
