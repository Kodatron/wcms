class GearController < ApplicationController
  before_action :init_api, only: [:show, :update, :create]
  before_action :login_required

  def show
  end

  def new
    @gear = Gear.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end


end
