class UsersController < ApplicationController
  layout 'layouts/landingpage'
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  #helper WowApi
  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
    @user.build_profile
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    @user.profile['avatar'] = init_character_avatar(user_params)
    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render status: 402, action: :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render status: 402, action: :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path, notice: 'User was successfully destroyed.'
  end

  private
    # TODO: Move to api-module
    def init_character_avatar user
      name = user['name']
      realm = user['profile_attributes']['wow_server']
      thumbnail = WowApi.new
      thumbnail.get_character_avatar(realm, name)
    end

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(
      :name, :email, :password, :password_confirmation,
      profile_attributes: [:user_id, :firstname, :lastname, :phone, :wow_region, :wow_server, :wow_class, :avatar]
      )
    end
end
