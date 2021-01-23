require "test_helper"

class UserPlantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_plant = user_plants(:one)
  end

  test "should get index" do
    get user_plants_url, as: :json
    assert_response :success
  end

  test "should create user_plant" do
    assert_difference('UserPlant.count') do
      post user_plants_url, params: { user_plant: { difficulty: @user_plant.difficulty, indoor: @user_plant.indoor, moisture: @user_plant.moisture, name: @user_plant.name, plant_id: @user_plant.plant_id, user_id: @user_plant.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show user_plant" do
    get user_plant_url(@user_plant), as: :json
    assert_response :success
  end

  test "should update user_plant" do
    patch user_plant_url(@user_plant), params: { user_plant: { difficulty: @user_plant.difficulty, indoor: @user_plant.indoor, moisture: @user_plant.moisture, name: @user_plant.name, plant_id: @user_plant.plant_id, user_id: @user_plant.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy user_plant" do
    assert_difference('UserPlant.count', -1) do
      delete user_plant_url(@user_plant), as: :json
    end

    assert_response 204
  end
end
