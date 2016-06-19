class CharactersController < ApplicationController
  before_action :set_character, except: [:create]

  def show
  end

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)
    if current_user.characters << @character

      interactor = SetupCharacter.call(
        character: @character
      )
      if interactor.success?
        flash[:notice] =  "Alt successfully created!"
        render :js => "window.location = '#{user_settings_path(tab: :alts)}'"
      else
        flash[:notice] = "Din alt skapades, men något gick fel vid import av gear."
        render :js => "window.location = '#{user_settings_path(tab: :alts)}'"
      end
    else
      respond_to do |format|
        format.json { render json: @character.errors.full_messages, status: 422 }
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def set_character
    @character = Character.find(params[:id])
  end

  def character_params
    params.require(:character).permit(:user_id, :name, :level, :wow_region, :wow_server, :wow_spec, :wow_class, :avatar_url, :profile_url, :state)
  end
end
