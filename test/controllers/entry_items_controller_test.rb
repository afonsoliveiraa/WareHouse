require "test_helper"

class EntryItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entry_item = entry_items(:one)
  end

  test "should get index" do
    get entry_items_url
    assert_response :success
  end

  test "should get new" do
    get new_entry_item_url
    assert_response :success
  end

  test "should create entry_item" do
    assert_difference("EntryItem.count") do
      post entry_items_url, params: { entry_item: { entry_id: @entry_item.entry_id, item_id: @entry_item.item_id, quantity: @entry_item.quantity, unit_price: @entry_item.unit_price } }
    end

    assert_redirected_to entry_item_url(EntryItem.last)
  end

  test "should show entry_item" do
    get entry_item_url(@entry_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_entry_item_url(@entry_item)
    assert_response :success
  end

  test "should update entry_item" do
    patch entry_item_url(@entry_item), params: { entry_item: { entry_id: @entry_item.entry_id, item_id: @entry_item.item_id, quantity: @entry_item.quantity, unit_price: @entry_item.unit_price } }
    assert_redirected_to entry_item_url(@entry_item)
  end

  test "should destroy entry_item" do
    assert_difference("EntryItem.count", -1) do
      delete entry_item_url(@entry_item)
    end

    assert_redirected_to entry_items_url
  end
end
