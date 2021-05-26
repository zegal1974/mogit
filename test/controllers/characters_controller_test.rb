require "test_helper"

class CharactersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @character = characters(:one)
  end

  test "should get index" do
    get characters_url
    assert_response :success
  end

  test "should get new" do
    get new_character_url
    assert_response :success
  end

  test "should create character" do
    assert_difference('Character.count') do
      post characters_url, params: { character: { active_covenant_id: @character.active_covenant_id, bind_location: @character.bind_location, chr_class_id: @character.chr_class_id, faction_id: @character.faction_id, gender: @character.gender, last_logout: @character.last_logout, last_update: @character.last_update, level: @character.level, money: @character.money, name: @character.name, played: @character.played, played_this_level: @character.played_this_level, race_id: @character.race_id, sub_zone: @character.sub_zone, zone: @character.zone } }
    end

    assert_redirected_to character_url(Character.last)
  end

  test "should show character" do
    get character_url(@character)
    assert_response :success
  end

  test "should get edit" do
    get edit_character_url(@character)
    assert_response :success
  end

  test "should update character" do
    patch character_url(@character), params: { character: { active_covenant_id: @character.active_covenant_id, bind_location: @character.bind_location, chr_class_id: @character.chr_class_id, faction_id: @character.faction_id, gender: @character.gender, last_logout: @character.last_logout, last_update: @character.last_update, level: @character.level, money: @character.money, name: @character.name, played: @character.played, played_this_level: @character.played_this_level, race_id: @character.race_id, sub_zone: @character.sub_zone, zone: @character.zone } }
    assert_redirected_to character_url(@character)
  end

  test "should destroy character" do
    assert_difference('Character.count', -1) do
      delete character_url(@character)
    end

    assert_redirected_to characters_url
  end
end
