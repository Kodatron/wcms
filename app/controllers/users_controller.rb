class UsersController < ApplicationController
  layout 'layouts/admin'
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :init_api, only: [:show, :update]

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
    password = user_params[:password]
    @user = User.new(user_params)
    @user.profile['avatar'] = @wow.get_character_avatar(@user.profile["wow_server"], @user.name)
    if @user.save
      UserMailer.new_user_email(@user, current_user, password).deliver_now
      redirect_to @user, notice: "#{@user.name} was successfully created."
    else
      render status: 402, action: :new
    end
  end

  def update
    if @user.update(user_params)
      @user.profile['avatar'] = @wow.get_character_avatar(@user.profile["wow_server"], @user.name)
      @user.save
      redirect_to @user, notice: "#{@user.name} was successfully updated."
    else
      render status: 402, action: :edit
    end
  end

  def destroy
    @user.destroy
    flash['warning'] = "#{@user.name} was permanently removed."
    redirect_to admin_users_path
  end

  def settings
    if current_user.name != params[:name]
      flash['warning'] = '403 Not Allowed'
      redirect_to :dashboard
    else
      @alt_request = AltRequest.new
      @alt = Alt.new
      render layout: 'layouts/application'
    end
  end

  private
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
