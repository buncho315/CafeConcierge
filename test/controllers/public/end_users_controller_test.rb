require "test_helper"

class Public::EndUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_end_users_index_url
    assert_response :success
  end

  test "should get show" do
    get public_end_users_show_url
    assert_response :success
  end

  test "should get destroy" do
    get public_end_users_destroy_url
    assert_response :success
  end
end
