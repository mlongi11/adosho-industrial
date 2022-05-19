require "test_helper"

class BreedWebsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @breed_web = breed_webs(:one)
  end

  test "should get index" do
    get breed_webs_url
    assert_response :success
  end

  test "should get new" do
    get new_breed_web_url
    assert_response :success
  end

  test "should create breed_web" do
    assert_difference('BreedWeb.count') do
      post breed_webs_url, params: { breed_web: { primary_breed_id: @breed_web.primary_breed_id, similar_breed_id: @breed_web.similar_breed_id } }
    end

    assert_redirected_to breed_web_url(BreedWeb.last)
  end

  test "should show breed_web" do
    get breed_web_url(@breed_web)
    assert_response :success
  end

  test "should get edit" do
    get edit_breed_web_url(@breed_web)
    assert_response :success
  end

  test "should update breed_web" do
    patch breed_web_url(@breed_web), params: { breed_web: { primary_breed_id: @breed_web.primary_breed_id, similar_breed_id: @breed_web.similar_breed_id } }
    assert_redirected_to breed_web_url(@breed_web)
  end

  test "should destroy breed_web" do
    assert_difference('BreedWeb.count', -1) do
      delete breed_web_url(@breed_web)
    end

    assert_redirected_to breed_webs_url
  end
end
