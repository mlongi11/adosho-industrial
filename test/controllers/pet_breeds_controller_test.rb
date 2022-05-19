require "test_helper"

class PetBreedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pet_breed = pet_breeds(:one)
  end

  test "should get index" do
    get pet_breeds_url
    assert_response :success
  end

  test "should get new" do
    get new_pet_breed_url
    assert_response :success
  end

  test "should create pet_breed" do
    assert_difference('PetBreed.count') do
      post pet_breeds_url, params: { pet_breed: { breed_id: @pet_breed.breed_id, pet_id: @pet_breed.pet_id } }
    end

    assert_redirected_to pet_breed_url(PetBreed.last)
  end

  test "should show pet_breed" do
    get pet_breed_url(@pet_breed)
    assert_response :success
  end

  test "should get edit" do
    get edit_pet_breed_url(@pet_breed)
    assert_response :success
  end

  test "should update pet_breed" do
    patch pet_breed_url(@pet_breed), params: { pet_breed: { breed_id: @pet_breed.breed_id, pet_id: @pet_breed.pet_id } }
    assert_redirected_to pet_breed_url(@pet_breed)
  end

  test "should destroy pet_breed" do
    assert_difference('PetBreed.count', -1) do
      delete pet_breed_url(@pet_breed)
    end

    assert_redirected_to pet_breeds_url
  end
end
