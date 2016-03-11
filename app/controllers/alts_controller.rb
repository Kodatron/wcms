class AltsController < ApplicationController
  before_action :set_alt, only: [:show, :edit, :update, :destroy]
  before_action :init_api, only: [:create]

  def show
  end

  def edit
  end

  def create
    @alt = current_user.alts.build(alt_params)
    @alt.avatar = @wow.get_character_avatar(@alt.wow_server, @alt.wow_name)
    if current_user.alts << @alt
      flash[:notice] = "Alt was successfully created!"
      render :js => "window.location = '#{user_settings_path(tab: :alts)}'"
    else
      respond_to do |format|
        format.json { render json: @alt.errors.full_messages, status: 422 }
      end
    end
  end

  def update
    if @alt.update(alt_params)
      redirect_to @alt, notice: 'Alt was successfully updated.'
    else
      render status: 402, action: :edit
    end
  end

  def destroy
    @alt.destroy
    redirect_to dashboard_path, notice: 'Alt was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alt
      @alt = Alt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def alt_params
      params.require(:alt).permit(:user_id, :wow_name, :wow_spec, :wow_region, :wow_server, :wow_class, :avatar)
    end
end
