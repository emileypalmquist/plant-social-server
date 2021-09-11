class Api::V1::UserPlantsController < ApplicationController
  before_action :set_user_plant, only: [:show, :update, :destroy]
  skip_before_action :authorized, only: [:index]

  # GET /user_plants
  def index
    # reverse the order so newest at front of array
    @user_plants = UserPlant.order('created_at DESC')

    render json: @user_plants
  end

  # GET /user_plants/1
  def show
    render json: @user_plant
  end

  # POST /user_plants
  def create
    # path = user_plant_params[:photo].tempfile.path
    # ImageProcessing::MiniMagick.source(path).resize_to_fit(250, 250).call(destination: path)
    user_plant = UserPlant.new(user_plant_params)
    # @user_plant.photo.attach(resized_image)
    plant = Plant.find_or_create_by(name: params[:plant].downcase)
    user_plant.plant_id = plant.id
    if user_plant.save

      render json: {user_plant: UserPlantSerializer.new(user_plant)}
    else
      render json: {messages: user_plant.errors.full_messages}, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_plants/1
  def update
    plant = Plant.find_or_create_by(name: params[:plant].downcase)
    @user_plant.plant_id = plant.id
    if @user_plant.update(user_plant_params)
      render json: @user_plant
    else
      render json: {messages: @user_plant.errors.full_messages}, status: :unprocessable_entity
    end
  end

  # DELETE /user_plants/1
  def destroy
    if @user_plant.destroy
      render json: {messages: ["RIP #{@user_plant.name}"]}
    end
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
