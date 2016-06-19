class SettingsController < ApplicationController
  before_action :set_setting, only: [:update, :destroy, :edit]

  def new
  end

  def edit
    if params[:tab] == 'alt_requests'
      @alt_requests = current_user.alt_requests.settings
    end
  end

  def create
    @setting = Setting.new(setting_params)
    if @setting.save
      redirect_to @setting, notice: 'Setting was successfully created.'
    else
      render status: 402, action: :new
    end
  end

  def update
    if @setting.update(setting_params)
      flash[:notice] = 'Setting was successfully updated.'
      redirect_to user_settings_path(tab: :settings)
    else
      flash[:warning] = 'Something went wrong..'
      redirect_to user_settings_path(tab: :settings)
    end
  end

  def destroy
    @setting.destroy
    redirect_to admin_index_path, notice: 'Setting was successfully destroyed.'
  end

  private
    def set_setting
      @user = current_user
      @setting = current_user.setting
      @alt_request = AltRequest.new if params[:tab] == 'alt_requests'
      @character = Character.new if params[:tab] = 'alts'
    end

    def setting_params
      params.require(:setting).permit(:user_id, :locale)
    end
end
