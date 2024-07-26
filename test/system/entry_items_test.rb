require "application_system_test_case"

class EntryItemsTest < ApplicationSystemTestCase
  setup do
    @entry_item = entry_items(:one)
  end

  test "visiting the index" do
    visit entry_items_url
    assert_selector "h1", text: "Entry items"
  end

  test "should create entry item" do
    visit entry_items_url
    click_on "New entry item"

    fill_in "Entry", with: @entry_item.entry_id
    fill_in "Item", with: @entry_item.item_id
    fill_in "Quantity", with: @entry_item.quantity
    fill_in "Unit price", with: @entry_item.unit_price
    click_on "Create Entry item"

    assert_text "Entry item was successfully created"
    click_on "Back"
  end

  test "should update Entry item" do
    visit entry_item_url(@entry_item)
    click_on "Edit this entry item", match: :first

    fill_in "Entry", with: @entry_item.entry_id
    fill_in "Item", with: @entry_item.item_id
    fill_in "Quantity", with: @entry_item.quantity
    fill_in "Unit price", with: @entry_item.unit_price
    click_on "Update Entry item"

    assert_text "Entry item was successfully updated"
    click_on "Back"
  end

  test "should destroy Entry item" do
    visit entry_item_url(@entry_item)
    click_on "Destroy this entry item", match: :first

    assert_text "Entry item was successfully destroyed"
  end
end
