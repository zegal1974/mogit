require "application_system_test_case"

class ProfilesTest < ApplicationSystemTestCase
  setup do
    @profile = profiles(:one)
  end

  test "visiting the index" do
    visit profiles_url
    assert_selector "h1", text: "Profiles"
  end

  test "creating a Profile" do
    visit profiles_url
    click_on "New Profile"

    fill_in "Active covenant", with: @profile.active_covenant_id
    fill_in "Bind location", with: @profile.bind_location
    fill_in "Claxx", with: @profile.claxx
    fill_in "Faction", with: @profile.faction
    fill_in "Gender", with: @profile.gender
    fill_in "Last logout", with: @profile.last_logout
    fill_in "Last update", with: @profile.last_update
    fill_in "Level", with: @profile.level
    fill_in "Money", with: @profile.money
    fill_in "Name", with: @profile.name
    fill_in "Played", with: @profile.played
    fill_in "Played this level", with: @profile.played_this_level
    fill_in "Race", with: @profile.race
    fill_in "Sub zone", with: @profile.sub_zone
    fill_in "Zone", with: @profile.zone
    click_on "Create Profile"

    assert_text "Profile was successfully created"
    click_on "Back"
  end

  test "updating a Profile" do
    visit profiles_url
    click_on "Edit", match: :first

    fill_in "Active covenant", with: @profile.active_covenant_id
    fill_in "Bind location", with: @profile.bind_location
    fill_in "Claxx", with: @profile.claxx
    fill_in "Faction", with: @profile.faction
    fill_in "Gender", with: @profile.gender
    fill_in "Last logout", with: @profile.last_logout
    fill_in "Last update", with: @profile.last_update
    fill_in "Level", with: @profile.level
    fill_in "Money", with: @profile.money
    fill_in "Name", with: @profile.name
    fill_in "Played", with: @profile.played
    fill_in "Played this level", with: @profile.played_this_level
    fill_in "Race", with: @profile.race
    fill_in "Sub zone", with: @profile.sub_zone
    fill_in "Zone", with: @profile.zone
    click_on "Update Profile"

    assert_text "Profile was successfully updated"
    click_on "Back"
  end

  test "destroying a Profile" do
    visit profiles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Profile was successfully destroyed"
  end
end
