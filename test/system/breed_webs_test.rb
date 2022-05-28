require "application_system_test_case"

class BreedWebsTest < ApplicationSystemTestCase
  setup do
    @breed_web = breed_webs(:one)
  end

  test "visiting the index" do
    visit breed_webs_url
    assert_selector "h1", text: "Breed Webs"
  end

  test "creating a Breed web" do
    visit breed_webs_url
    click_on "New Breed Web"

    fill_in "Primary breed", with: @breed_web.primary_breed_id
    fill_in "Similar breed", with: @breed_web.similar_breed_id
    click_on "Create Breed web"

    assert_text "Breed web was successfully created"
    click_on "Back"
  end

  test "updating a Breed web" do
    visit breed_webs_url
    click_on "Edit", match: :first

    fill_in "Primary breed", with: @breed_web.primary_breed_id
    fill_in "Similar breed", with: @breed_web.similar_breed_id
    click_on "Update Breed web"

    assert_text "Breed web was successfully updated"
    click_on "Back"
  end

  test "destroying a Breed web" do
    visit breed_webs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Breed web was successfully destroyed"
  end
end
