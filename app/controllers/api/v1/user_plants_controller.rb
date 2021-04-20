class Api::V1::UserPlantsController < ApplicationController
  before_action :set_user_plant, only: [:show, :update, :destroy]
  skip_before_action :authorized, only: [:index]

  # GET /user_plants
  def index
    # Might want to change this to just plants that are not the logged in user?
    # need to make ssure that sti
    @user_plants = UserPlant.all

    render json: @user_plants
  end

  # GET /user_plants/1
  def show
    render json: @user_plant
  end

  # POST /user_plants
  def create
    @user_plant = UserPlant.new(user_plant_params)
    if @user_plant.save
      render json: {user_plant: UserPlantSerializer.new(@user_plant)}
    else
      render json: {messages: @user_plant.errors.full_messages}, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_plants/1
  def update
    if @user_plant.update(user_plant_params)
      render json: @user_plant
    else
      render json: {messages: @user_plant.errors.full_messages}, status: :unprocessable_entity
    end
  end

  # DELETE /user_plants/1
  def destroy
    @user_plant.destroy
    render json: {messages: ["RIP #{@user_plant.name}"]}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_plant
      @user_plant = UserPlant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_plant_params
      params.permit(:user_id, :plant_id, :name, :difficulty, :moisture, :indoor, :photo)
    end
end
