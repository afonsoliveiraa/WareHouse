require "application_system_test_case"

class PasTest < ApplicationSystemTestCase
  setup do
    @pa = pas(:one)
  end

  test "visiting the index" do
    visit pas_url
    assert_selector "h1", text: "Pas"
  end

  test "should create pa" do
    visit pas_url
    click_on "New pa"

    fill_in "Code", with: @pa.code
    fill_in "Description", with: @pa.description
    fill_in "End date", with: @pa.end_date
    fill_in "Horizon", with: @pa.horizon
    fill_in "Objective", with: @pa.objective
    fill_in "Start date", with: @pa.start_date
    fill_in "Uo", with: @pa.uo_id
    click_on "Create Pa"

    assert_text "Pa was successfully created"
    click_on "Back"
  end

  test "should update Pa" do
    visit pa_url(@pa)
    click_on "Edit this pa", match: :first

    fill_in "Code", with: @pa.code
    fill_in "Description", with: @pa.description
    fill_in "End date", with: @pa.end_date
    fill_in "Horizon", with: @pa.horizon
    fill_in "Objective", with: @pa.objective
    fill_in "Start date", with: @pa.start_date
    fill_in "Uo", with: @pa.uo_id
    click_on "Update Pa"

    assert_text "Pa was successfully updated"
    click_on "Back"
  end

  test "should destroy Pa" do
    visit pa_url(@pa)
    click_on "Destroy this pa", match: :first

    assert_text "Pa was successfully destroyed"
  end
end
