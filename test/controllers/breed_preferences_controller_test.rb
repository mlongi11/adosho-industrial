require "test_helper"

class BreedPreferencesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @breed_preference = breed_preferences(:one)
  end

  test "should get index" do
    get breed_preferences_url
    assert_response :success
  end

  test "should get new" do
    get new_breed_preference_url
    assert_response :success
  end

  test "should create breed_preference" do
    assert_difference('BreedPreference.count') do
      post breed_preferences_url, params: { breed_preference: { breed_id: @breed_preference.breed_id, user_id: @breed_preference.user_id } }
    end

    assert_redirected_to breed_preference_url(BreedPreference.last)
  end

  test "should show breed_preference" do
    get breed_preference_url(@breed_preference)
    assert_response :success
  end

  test "should get edit" do
    get edit_breed_preference_url(@breed_preference)
    assert_response :success
  end

  test "should update breed_preference" do
    patch breed_preference_url(@breed_preference), params: { breed_preference: { breed_id: @breed_preference.breed_id, user_id: @breed_preference.user_id } }
    assert_redirected_to breed_preference_url(@breed_preference)
  end

  test "should destroy breed_preference" do
    assert_difference('BreedPreference.count', -1) do
      delete breed_preference_url(@breed_preference)
    end

    assert_redirected_to breed_preferences_url
  end
end
