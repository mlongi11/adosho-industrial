require "application_system_test_case"

class ListOfBreedsTest < ApplicationSystemTestCase
  setup do
    @list_of_breed = list_of_breeds(:one)
  end

  test "visiting the index" do
    visit list_of_breeds_url
    assert_selector "h1", text: "List Of Breeds"
  end

  test "creating a List of breed" do
    visit list_of_breeds_url
    click_on "New List Of Breed"

    fill_in "Breed name", with: @list_of_breed.breed_name
    fill_in "Species", with: @list_of_breed.species
    click_on "Create List of breed"

    assert_text "List of breed was successfully created"
    click_on "Back"
  end

  test "updating a List of breed" do
    visit list_of_breeds_url
    click_on "Edit", match: :first

    fill_in "Breed name", with: @list_of_breed.breed_name
    fill_in "Species", with: @list_of_breed.species
    click_on "Update List of breed"

    assert_text "List of breed was successfully updated"
    click_on "Back"
  end

  test "destroying a List of breed" do
    visit list_of_breeds_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "List of breed was successfully destroyed"
  end
end
