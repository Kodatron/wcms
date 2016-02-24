class AltsController < ApplicationController
  before_action :set_alt, only: [:show, :edit, :update, :destroy]
  before_action :init_api, only: [:create]

  def show
  end

  def new
    @alt = Alt.new
  end

  def edit
  end

  def create
    @alt = Alt.new(alt_params)
    @alt.avatar = @wow.get_character_avatar(@alt.wow_server, @alt.wow_name)
    if current_user.alts << @alt
      redirect_to dashboard_path, notice: 'Alt was successfully created.'
    else
      render status: 402, action: :new
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
