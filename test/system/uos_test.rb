require "application_system_test_case"

class UosTest < ApplicationSystemTestCase
  setup do
    @uo = uos(:one)
  end

  test "visiting the index" do
    visit uos_url
    assert_selector "h1", text: "Uos"
  end

  test "should create uo" do
    visit uos_url
    click_on "New uo"

    fill_in "Abbreviation", with: @uo.abbreviation
    fill_in "Description", with: @uo.description
    fill_in "End date", with: @uo.end_date
    fill_in "Kind", with: @uo.kind
    fill_in "Start date", with: @uo.start_date
    click_on "Create Uo"

    assert_text "Uo was successfully created"
    click_on "Back"
  end

  test "should update Uo" do
    visit uo_url(@uo)
    click_on "Edit this uo", match: :first

    fill_in "Abbreviation", with: @uo.abbreviation
    fill_in "Description", with: @uo.description
    fill_in "End date", with: @uo.end_date
    fill_in "Kind", with: @uo.kind
    fill_in "Start date", with: @uo.start_date
    click_on "Update Uo"

    assert_text "Uo was successfully updated"
    click_on "Back"
  end

  test "should destroy Uo" do
    visit uo_url(@uo)
    click_on "Destroy this uo", match: :first

    assert_text "Uo was successfully destroyed"
  end
end
