class UsersController < ApplicationController
  layout 'layouts/admin'
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :init_api, only: [:show, :update, :create]

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
    if @user.save
      @user.profile.update_attributes!(avatar: @wow.get_character_avatar(@user.profile.wow_server, @user.name))
      UserMailer.create_user_mail(@user).deliver_now
      redirect_to @user, notice: "#{@user.name} was successfully created."
    else
      render status: 402, action: :new
    end
  end

  def update
    if @user && !@user.activated?
      @user.update_attribute(:activated , true)
      @user.update_attribute(:activated_at, Time.zone.now)
      if @user.update(user_params)
        log_in @user
        flash[:notice] = t(:Account_activated)
        redirect_to :dashboard
      end
    elsif @user.update(user_params)
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
