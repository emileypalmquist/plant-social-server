require "test_helper"

class FavoritePlantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @favorite_plant = favorite_plants(:one)
  end

  test "should get index" do
    get favorite_plants_url, as: :json
    assert_response :success
  end

  test "should create favorite_plant" do
    assert_difference('FavoritePlant.count') do
      post favorite_plants_url, params: { favorite_plant: { plant_id: @favorite_plant.plant_id, user_id: @favorite_plant.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show favorite_plant" do
    get favorite_plant_url(@favorite_plant), as: :json
    assert_response :success
  end

  test "should update favorite_plant" do
    patch favorite_plant_url(@favorite_plant), params: { favorite_plant: { plant_id: @favorite_plant.plant_id, user_id: @favorite_plant.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy favorite_plant" do
    assert_difference('FavoritePlant.count', -1) do
      delete favorite_plant_url(@favorite_plant), as: :json
    end

    assert_response 204
  end
end
