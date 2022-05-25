require "application_system_test_case"

class BreedPreferencesTest < ApplicationSystemTestCase
  setup do
    @breed_preference = breed_preferences(:one)
  end

  test "visiting the index" do
    visit breed_preferences_url
    assert_selector "h1", text: "Breed Preferences"
  end

  test "creating a Breed preference" do
    visit breed_preferences_url
    click_on "New Breed Preference"

    fill_in "Breed", with: @breed_preference.breed_id
    fill_in "User", with: @breed_preference.user_id
    click_on "Create Breed preference"

    assert_text "Breed preference was successfully created"
    click_on "Back"
  end

  test "updating a Breed preference" do
    visit breed_preferences_url
    click_on "Edit", match: :first

    fill_in "Breed", with: @breed_preference.breed_id
    fill_in "User", with: @breed_preference.user_id
    click_on "Update Breed preference"

    assert_text "Breed preference was successfully updated"
    click_on "Back"
  end

  test "destroying a Breed preference" do
    visit breed_preferences_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Breed preference was successfully destroyed"
  end
end
