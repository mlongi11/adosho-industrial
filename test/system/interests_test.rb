require "application_system_test_case"

class InterestsTest < ApplicationSystemTestCase
  setup do
    @interest = interests(:one)
  end

  test "visiting the index" do
    visit interests_url
    assert_selector "h1", text: "Interests"
  end

  test "creating a Interest" do
    visit interests_url
    click_on "New Interest"

    fill_in "Activity competability preference", with: @interest.activity_competability_preference
    fill_in "Cat competability preference", with: @interest.cat_competability_preference
    fill_in "Children competability preference", with: @interest.children_competability_preference
    fill_in "Dog competability preference", with: @interest.dog_competability_preference
    fill_in "Enrichment competability preference", with: @interest.enrichment_competability_preference
    fill_in "Home alone competability preference", with: @interest.home_alone_competability_preference
    fill_in "Human sociability competability preference", with: @interest.human_sociability_competability_preference
    check "Interested in adopting cats" if @interest.interested_in_adopting_cats
    check "Interested in adopting dogs" if @interest.interested_in_adopting_dogs
    check "Interested in fostering cats" if @interest.interested_in_fostering_cats
    check "Interested in fostering dogs" if @interest.interested_in_fostering_dogs
    click_on "Create Interest"

    assert_text "Interest was successfully created"
    click_on "Back"
  end

  test "updating a Interest" do
    visit interests_url
    click_on "Edit", match: :first

    fill_in "Activity competability preference", with: @interest.activity_competability_preference
    fill_in "Cat competability preference", with: @interest.cat_competability_preference
    fill_in "Children competability preference", with: @interest.children_competability_preference
    fill_in "Dog competability preference", with: @interest.dog_competability_preference
    fill_in "Enrichment competability preference", with: @interest.enrichment_competability_preference
    fill_in "Home alone competability preference", with: @interest.home_alone_competability_preference
    fill_in "Human sociability competability preference", with: @interest.human_sociability_competability_preference
    check "Interested in adopting cats" if @interest.interested_in_adopting_cats
    check "Interested in adopting dogs" if @interest.interested_in_adopting_dogs
    check "Interested in fostering cats" if @interest.interested_in_fostering_cats
    check "Interested in fostering dogs" if @interest.interested_in_fostering_dogs
    click_on "Update Interest"

    assert_text "Interest was successfully updated"
    click_on "Back"
  end

  test "destroying a Interest" do
    visit interests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Interest was successfully destroyed"
  end
end
