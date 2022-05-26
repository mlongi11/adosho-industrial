require "application_system_test_case"

class PetBreedsTest < ApplicationSystemTestCase
  setup do
    @pet_breed = pet_breeds(:one)
  end

  test "visiting the index" do
    visit pet_breeds_url
    assert_selector "h1", text: "Pet Breeds"
  end

  test "creating a Pet breed" do
    visit pet_breeds_url
    click_on "New Pet Breed"

    fill_in "Breed", with: @pet_breed.breed_id
    fill_in "Pet", with: @pet_breed.pet_id
    click_on "Create Pet breed"

    assert_text "Pet breed was successfully created"
    click_on "Back"
  end

  test "updating a Pet breed" do
    visit pet_breeds_url
    click_on "Edit", match: :first

    fill_in "Breed", with: @pet_breed.breed_id
    fill_in "Pet", with: @pet_breed.pet_id
    click_on "Update Pet breed"

    assert_text "Pet breed was successfully updated"
    click_on "Back"
  end

  test "destroying a Pet breed" do
    visit pet_breeds_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pet breed was successfully destroyed"
  end
end
