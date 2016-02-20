class GuildApplicationsController < ApplicationController
  require 'securerandom'
  layout 'layouts/admin'
  before_action :check_admin, except: [:new]
  before_action :set_guild_application, only: [:show, :edit, :update, :destroy]
  before_action :init_wow_api

  def show
    @stats = RBattlenet::Wow::Character.find(name: @guild_application.wow_name, realm: @guild_application.wow_server, fields: ["items"])
  end

  def new
    @guild_application = GuildApplication.new
    render layout: 'layouts/landingpage'
  end

  def approve
    @guild_application = GuildApplication.find(params[:guild_application_id])
    if @guild_application.approved!
      create_user_and_profile_from_application(@guild_application, params[:reason])
      redirect_to admin_applications_path
    end
  end

  def decline
    @guild_application = GuildApplication.find(params[:guild_application_id])
    if @guild_application.declined!
      UserMailer.declined_application_email(@guild_application, params[:reason], current_user).deliver_now
      redirect_to admin_applications_path
    end
  end

  def edit
  end

  def create
    @guild_application = GuildApplication.new(guild_application_params)
    respond_to do |format|
      if @guild_application.save
        UserMailer.guild_application_email(@guild_application).deliver_now
        AdminMailer.new_application_mail(@guild_application).deliver_now
        format.html { redirect_to @guild_application, notice: 'Guild application was successfully created.' }
        format.json { render :show, status: :created, location: @guild_application }
      else
        format.html { render :new }
        format.json { render json: @guild_application.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @guild_application.update(guild_application_params)
        format.html { redirect_to @guild_application, notice: 'Guild application was successfully updated.' }
        format.json { render :show, status: :ok, location: @guild_application }
      else
        format.html { render :edit }
        format.json { render json: @guild_application.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @guild_application.destroy
    respond_to do |format|
      format.html { redirect_to guild_applications_url, notice: 'Guild application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def create_user_and_profile_from_application(ga, reason)
    password = SecureRandom.hex(8)
    @user = User.new(name: ga.wow_name, email: ga.email, password: password)
    @user.save!
    @profile = Profile.new(user_id: @user.id, wow_server: ga.wow_server, wow_region: ga.wow_region, wow_class: ga.wow_class, firstname: ga.firstname, lastname: ga.lastname, phone: ga.phone, avatar: init_character_avatar(ga.wow_name, ga.wow_server))
    @profile.save!
    UserMailer.approved_application_email(@user, password, reason, current_user).deliver_now
  end

  private
    # TODO: Move to api-module
    def init_character_avatar name, realm
      RBattlenet.authenticate(api_key: ENV['BLIZZ_KEY'])
      RBattlenet.set_region(region: "eu", locale: "en_GB")
      character = RBattlenet::Wow::Character.find(name: name, realm: realm)
      character['thumbnail']
    end

    def init_wow_api
      @wow ||= RBattlenet.authenticate(api_key: ENV['BLIZZ_KEY'])
      @wow ||= RBattlenet.set_region(region: "eu", locale: "en_GB")
      @wow
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_guild_application
      @guild_application = GuildApplication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def guild_application_params
      params.require(:guild_application).permit(
        :wow_name, :wow_class, :email, :status, :wow_region, :wow_server, :wow_spec,
        :firstname, :lastname, :phone, :raid_ui, :age,
        :q_1, :q_2, :q_3, :q_4, :q_5, :q_6, :q_7, :q_8
      )
    end
end
