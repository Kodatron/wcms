class AltsController < ApplicationController
  before_action :set_alt, only: [:show, :edit, :update, :destroy]

  # GET /alts
  # GET /alts.json
  def index
    @alts = Alt.all
  end

  # GET /alts/1
  # GET /alts/1.json
  def show
  end

  # GET /alts/new
  def new
    @alt = Alt.new
  end

  # GET /alts/1/edit
  def edit
  end

  # POST /alts
  # POST /alts.json
  def create
    @alt = Alt.new(alt_params)

    respond_to do |format|
      if @alt.save
        format.html { redirect_to @alt, notice: 'Alt was successfully created.' }
        format.json { render :show, status: :created, location: @alt }
      else
        format.html { render :new }
        format.json { render json: @alt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alts/1
  # PATCH/PUT /alts/1.json
  def update
    respond_to do |format|
      if @alt.update(alt_params)
        format.html { redirect_to @alt, notice: 'Alt was successfully updated.' }
        format.json { render :show, status: :ok, location: @alt }
      else
        format.html { render :edit }
        format.json { render json: @alt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alts/1
  # DELETE /alts/1.json
  def destroy
    @alt.destroy
    respond_to do |format|
      format.html { redirect_to alts_url, notice: 'Alt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alt
      @alt = Alt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def alt_params
      params.fetch(:alt, {})
    end
end
