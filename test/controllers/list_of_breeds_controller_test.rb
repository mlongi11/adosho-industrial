require "test_helper"

class ListOfBreedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @list_of_breed = list_of_breeds(:one)
  end

  test "should get index" do
    get list_of_breeds_url
    assert_response :success
  end

  test "should get new" do
    get new_list_of_breed_url
    assert_response :success
  end

  test "should create list_of_breed" do
    assert_difference('ListOfBreed.count') do
      post list_of_breeds_url, params: { list_of_breed: { breed_name: @list_of_breed.breed_name, species: @list_of_breed.species } }
    end

    assert_redirected_to list_of_breed_url(ListOfBreed.last)
  end

  test "should show list_of_breed" do
    get list_of_breed_url(@list_of_breed)
    assert_response :success
  end

  test "should get edit" do
    get edit_list_of_breed_url(@list_of_breed)
    assert_response :success
  end

  test "should update list_of_breed" do
    patch list_of_breed_url(@list_of_breed), params: { list_of_breed: { breed_name: @list_of_breed.breed_name, species: @list_of_breed.species } }
    assert_redirected_to list_of_breed_url(@list_of_breed)
  end

  test "should destroy list_of_breed" do
    assert_difference('ListOfBreed.count', -1) do
      delete list_of_breed_url(@list_of_breed)
    end

    assert_redirected_to list_of_breeds_url
  end
end
