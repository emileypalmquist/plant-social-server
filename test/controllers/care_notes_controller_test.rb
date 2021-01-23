require "test_helper"

class CareNotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @care_note = care_notes(:one)
  end

  test "should get index" do
    get care_notes_url, as: :json
    assert_response :success
  end

  test "should create care_note" do
    assert_difference('CareNote.count') do
      post care_notes_url, params: { care_note: { content: @care_note.content, user_plant_id: @care_note.user_plant_id } }, as: :json
    end

    assert_response 201
  end

  test "should show care_note" do
    get care_note_url(@care_note), as: :json
    assert_response :success
  end

  test "should update care_note" do
    patch care_note_url(@care_note), params: { care_note: { content: @care_note.content, user_plant_id: @care_note.user_plant_id } }, as: :json
    assert_response 200
  end

  test "should destroy care_note" do
    assert_difference('CareNote.count', -1) do
      delete care_note_url(@care_note), as: :json
    end

    assert_response 204
  end
end
