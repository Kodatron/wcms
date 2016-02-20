class ProfilesController < ApplicationController
  before_action :set_profile, only: [:edit, :update, :destroy]

  def show
    @user = User.find(params[:name])
    RBattlenet.authenticate(api_key: ENV['BLIZZ_KEY'])
    RBattlenet.set_region(region: "eu", locale: "en_GB")
    @userData = RBattlenet::Wow::Character.find(name: @user.name, realm: @user.profile.wow_server, fields: ["feed", "items", "progression", 'talents'])
  end

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
