require "test_helper"

class InterestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @interest = interests(:one)
  end

  test "should get index" do
    get interests_url
    assert_response :success
  end

  test "should get new" do
    get new_interest_url
    assert_response :success
  end

  test "should create interest" do
    assert_difference('Interest.count') do
      post interests_url, params: { interest: { activity_competability_preference: @interest.activity_competability_preference, cat_competability_preference: @interest.cat_competability_preference, children_competability_preference: @interest.children_competability_preference, dog_competability_preference: @interest.dog_competability_preference, enrichment_competability_preference: @interest.enrichment_competability_preference, home_alone_competability_preference: @interest.home_alone_competability_preference, human_sociability_competability_preference: @interest.human_sociability_competability_preference, interested_in_adopting_cats: @interest.interested_in_adopting_cats, interested_in_adopting_dogs: @interest.interested_in_adopting_dogs, interested_in_fostering_cats: @interest.interested_in_fostering_cats, interested_in_fostering_dogs: @interest.interested_in_fostering_dogs, user_id: @interest.user_id } }
    end

    assert_redirected_to interest_url(Interest.last)
  end

  test "should show interest" do
    get interest_url(@interest)
    assert_response :success
  end

  test "should get edit" do
    get edit_interest_url(@interest)
    assert_response :success
  end

  test "should update interest" do
    patch interest_url(@interest), params: { interest: { activity_competability_preference: @interest.activity_competability_preference, cat_competability_preference: @interest.cat_competability_preference, children_competability_preference: @interest.children_competability_preference, dog_competability_preference: @interest.dog_competability_preference, enrichment_competability_preference: @interest.enrichment_competability_preference, home_alone_competability_preference: @interest.home_alone_competability_preference, human_sociability_competability_preference: @interest.human_sociability_competability_preference, interested_in_adopting_cats: @interest.interested_in_adopting_cats, interested_in_adopting_dogs: @interest.interested_in_adopting_dogs, interested_in_fostering_cats: @interest.interested_in_fostering_cats, interested_in_fostering_dogs: @interest.interested_in_fostering_dogs, user_id: @interest.user_id } }
    assert_redirected_to interest_url(@interest)
  end

  test "should destroy interest" do
    assert_difference('Interest.count', -1) do
      delete interest_url(@interest)
    end

    assert_redirected_to interests_url
  end
end
