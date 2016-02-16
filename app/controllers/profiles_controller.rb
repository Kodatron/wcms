class ProfilesController < ApplicationController
  before_action :set_profile, only: [:edit, :update, :destroy]

  def edit
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      # TODO: Change path when current_user is fixed
      redirect_to users_path, notice: 'Profile was successfully created.'
    else
      render status: 402, action: :new
    end
  end

  def update
    if @profile.update(profile_params)
      # TODO: Change path when current_user is fixed
      redirect_to users_path, notice: 'Profile was successfully updated.'
    else
      render status: 402, action: :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.fetch(:profile, {})
    end
end
