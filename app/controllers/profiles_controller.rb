class ProfilesController < ApplicationController
  before_action :set_profile, only: [:edit, :update, :destroy]
  before_action :init_api, only: [:show]

  def show
    @user = User.find(params[:name])
    @userData = @wow.get_character_data(@user.name, realm: @user.profile.wow_server, fields: ["feed", "items", "progression", 'talents'])
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      flash[:notice] = "Your profile was successfully updated!"
      redirect_to user_settings_path(tab: :profile)
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
      params.require(:profile).permit(:user_id, :firstname, :lastname, :phone, :wow_region, :wow_server, :wow_class, :avatar)
    end
end
