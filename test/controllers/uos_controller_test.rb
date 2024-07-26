require "test_helper"

class UosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @uo = uos(:one)
  end

  test "should get index" do
    get uos_url
    assert_response :success
  end

  test "should get new" do
    get new_uo_url
    assert_response :success
  end

  test "should create uo" do
    assert_difference("Uo.count") do
      post uos_url, params: { uo: { abbreviation: @uo.abbreviation, description: @uo.description, end_date: @uo.end_date, kind: @uo.kind, start_date: @uo.start_date } }
    end

    assert_redirected_to uo_url(Uo.last)
  end

  test "should show uo" do
    get uo_url(@uo)
    assert_response :success
  end

  test "should get edit" do
    get edit_uo_url(@uo)
    assert_response :success
  end

  test "should update uo" do
    patch uo_url(@uo), params: { uo: { abbreviation: @uo.abbreviation, description: @uo.description, end_date: @uo.end_date, kind: @uo.kind, start_date: @uo.start_date } }
    assert_redirected_to uo_url(@uo)
  end

  test "should destroy uo" do
    assert_difference("Uo.count", -1) do
      delete uo_url(@uo)
    end

    assert_redirected_to uos_url
  end
end
