require "application_system_test_case"

class BreedsTest < ApplicationSystemTestCase
  setup do
    @breed = breeds(:one)
  end

  test "visiting the index" do
    visit breeds_url
    assert_selector "h1", text: "Breeds"
  end

  test "creating a Breed" do
    visit breeds_url
    click_on "New Breed"

    fill_in "Breed", with: @breed.breed_id
    fill_in "Preferences", with: @breed.preferences
    fill_in "User", with: @breed.user_id
    click_on "Create Breed"

    assert_text "Breed was successfully created"
    click_on "Back"
  end

  test "updating a Breed" do
    visit breeds_url
    click_on "Edit", match: :first

    fill_in "Breed", with: @breed.breed_id
    fill_in "Preferences", with: @breed.preferences
    fill_in "User", with: @breed.user_id
    click_on "Update Breed"

    assert_text "Breed was successfully updated"
    click_on "Back"
  end

  test "destroying a Breed" do
    visit breeds_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Breed was successfully destroyed"
  end
end
