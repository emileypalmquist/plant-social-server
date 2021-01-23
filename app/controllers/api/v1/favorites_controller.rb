class Api::V1::FavoritesController < ApplicationController
  before_action :set_favorite_plant, only: [:show, :update, :destroy]

  # GET /favorite_plants
  def index
    @favorite_plants = FavoritePlant.all

    render json: @favorite_plants
  end

  # GET /favorite_plants/1
  def show
    render json: @favorite_plant
  end

  # POST /favorite_plants
  def create
    @favorite_plant = FavoritePlant.new(favorite_plant_params)

    if @favorite_plant.save
      render json: @favorite_plant, status: :created, location: @favorite_plant
    else
      render json: @favorite_plant.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /favorite_plants/1
  def update
    if @favorite_plant.update(favorite_plant_params)
      render json: @favorite_plant
    else
      render json: @favorite_plant.errors, status: :unprocessable_entity
    end
  end

  # DELETE /favorite_plants/1
  def destroy
    @favorite_plant.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite_plant
      @favorite_plant = FavoritePlant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def favorite_plant_params
      params.require(:favorite_plant).permit(:user_id, :plant_id)
    end
end
