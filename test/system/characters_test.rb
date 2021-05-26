require "application_system_test_case"

class CharactersTest < ApplicationSystemTestCase
  setup do
    @character = characters(:one)
  end

  test "visiting the index" do
    visit characters_url
    assert_selector "h1", text: "Characters"
  end

  test "creating a Character" do
    visit characters_url
    click_on "New Character"

    fill_in "Active covenant", with: @character.active_covenant_id
    fill_in "Bind location", with: @character.bind_location
    fill_in "Chr class", with: @character.chr_class_id
    fill_in "Faction", with: @character.faction_id
    fill_in "Gender", with: @character.gender
    fill_in "Last logout", with: @character.last_logout
    fill_in "Last update", with: @character.last_update
    fill_in "Level", with: @character.level
    fill_in "Money", with: @character.money
    fill_in "Name", with: @character.name
    fill_in "Played", with: @character.played
    fill_in "Played this level", with: @character.played_this_level
    fill_in "Race", with: @character.race_id
    fill_in "Sub zone", with: @character.sub_zone
    fill_in "Zone", with: @character.zone
    click_on "Create Character"

    assert_text "Character was successfully created"
    click_on "Back"
  end

  test "updating a Character" do
    visit characters_url
    click_on "Edit", match: :first

    fill_in "Active covenant", with: @character.active_covenant_id
    fill_in "Bind location", with: @character.bind_location
    fill_in "Chr class", with: @character.chr_class_id
    fill_in "Faction", with: @character.faction_id
    fill_in "Gender", with: @character.gender
    fill_in "Last logout", with: @character.last_logout
    fill_in "Last update", with: @character.last_update
    fill_in "Level", with: @character.level
    fill_in "Money", with: @character.money
    fill_in "Name", with: @character.name
    fill_in "Played", with: @character.played
    fill_in "Played this level", with: @character.played_this_level
    fill_in "Race", with: @character.race_id
    fill_in "Sub zone", with: @character.sub_zone
    fill_in "Zone", with: @character.zone
    click_on "Update Character"

    assert_text "Character was successfully updated"
    click_on "Back"
  end

  test "destroying a Character" do
    visit characters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Character was successfully destroyed"
  end
end
