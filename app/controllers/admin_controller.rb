class AdminController < ApplicationController
  #layout 'layouts/admin'
  layout 'landingpage'
  before_filter :check_admin

  def index
  end

  def blog
  end

  private
  def check_admin
    true
  end
end
