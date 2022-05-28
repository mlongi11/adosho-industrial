require "test_helper"

class PetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pet = pets(:one)
  end

  test "should get index" do
    get pets_url
    assert_response :success
  end

  test "should get new" do
    get new_pet_url
    assert_response :success
  end

  test "should create pet" do
    assert_difference('Pet.count') do
      post pets_url, params: { pet: { activity_competability_ranking: @pet.activity_competability_ranking, adopter_id: @pet.adopter_id, adoption_center_identifier: @pet.adoption_center_identifier, cat_competability_ranking: @pet.cat_competability_ranking, children_competability_ranking: @pet.children_competability_ranking, dog_competability_ranking: @pet.dog_competability_ranking, enrichment_competability_ranking: @pet.enrichment_competability_ranking, estimated_birthday: @pet.estimated_birthday, gender: @pet.gender, home_alone_competability_ranking: @pet.home_alone_competability_ranking, human_socialability_competability_ranking: @pet.human_socialability_competability_ranking, name: @pet.name, notes: @pet.notes, picture: @pet.picture, status: @pet.status, weight: @pet.weight } }
    end

    assert_redirected_to pet_url(Pet.last)
  end

  test "should show pet" do
    get pet_url(@pet)
    assert_response :success
  end

  test "should get edit" do
    get edit_pet_url(@pet)
    assert_response :success
  end

  test "should update pet" do
    patch pet_url(@pet), params: { pet: { activity_competability_ranking: @pet.activity_competability_ranking, adopter_id: @pet.adopter_id, adoption_center_identifier: @pet.adoption_center_identifier, cat_competability_ranking: @pet.cat_competability_ranking, children_competability_ranking: @pet.children_competability_ranking, dog_competability_ranking: @pet.dog_competability_ranking, enrichment_competability_ranking: @pet.enrichment_competability_ranking, estimated_birthday: @pet.estimated_birthday, gender: @pet.gender, home_alone_competability_ranking: @pet.home_alone_competability_ranking, human_socialability_competability_ranking: @pet.human_socialability_competability_ranking, name: @pet.name, notes: @pet.notes, picture: @pet.picture, status: @pet.status, weight: @pet.weight } }
    assert_redirected_to pet_url(@pet)
  end

  test "should destroy pet" do
    assert_difference('Pet.count', -1) do
      delete pet_url(@pet)
    end

    assert_redirected_to pets_url
  end
end
