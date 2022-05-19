require "application_system_test_case"

class PetsTest < ApplicationSystemTestCase
  setup do
    @pet = pets(:one)
  end

  test "visiting the index" do
    visit pets_url
    assert_selector "h1", text: "Pets"
  end

  test "creating a Pet" do
    visit pets_url
    click_on "New Pet"

    fill_in "Activity competability ranking", with: @pet.activity_competability_ranking
    fill_in "Adopter", with: @pet.adopter_id
    fill_in "Adoption center identifier", with: @pet.adoption_center_identifier
    fill_in "Cat competability ranking", with: @pet.cat_competability_ranking
    fill_in "Children competability ranking", with: @pet.children_competability_ranking
    fill_in "Dog competability ranking", with: @pet.dog_competability_ranking
    fill_in "Enrichment competability ranking", with: @pet.enrichment_competability_ranking
    fill_in "Estimated birthday", with: @pet.estimated_birthday
    fill_in "Gender", with: @pet.gender
    fill_in "Home alone competability ranking", with: @pet.home_alone_competability_ranking
    fill_in "Human socialability competability ranking", with: @pet.human_socialability_competability_ranking
    fill_in "Name", with: @pet.name
    fill_in "Notes", with: @pet.notes
    fill_in "Picture", with: @pet.picture
    fill_in "Status", with: @pet.status
    fill_in "Weight", with: @pet.weight
    click_on "Create Pet"

    assert_text "Pet was successfully created"
    click_on "Back"
  end

  test "updating a Pet" do
    visit pets_url
    click_on "Edit", match: :first

    fill_in "Activity competability ranking", with: @pet.activity_competability_ranking
    fill_in "Adopter", with: @pet.adopter_id
    fill_in "Adoption center identifier", with: @pet.adoption_center_identifier
    fill_in "Cat competability ranking", with: @pet.cat_competability_ranking
    fill_in "Children competability ranking", with: @pet.children_competability_ranking
    fill_in "Dog competability ranking", with: @pet.dog_competability_ranking
    fill_in "Enrichment competability ranking", with: @pet.enrichment_competability_ranking
    fill_in "Estimated birthday", with: @pet.estimated_birthday
    fill_in "Gender", with: @pet.gender
    fill_in "Home alone competability ranking", with: @pet.home_alone_competability_ranking
    fill_in "Human socialability competability ranking", with: @pet.human_socialability_competability_ranking
    fill_in "Name", with: @pet.name
    fill_in "Notes", with: @pet.notes
    fill_in "Picture", with: @pet.picture
    fill_in "Status", with: @pet.status
    fill_in "Weight", with: @pet.weight
    click_on "Update Pet"

    assert_text "Pet was successfully updated"
    click_on "Back"
  end

  test "destroying a Pet" do
    visit pets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pet was successfully destroyed"
  end
end
