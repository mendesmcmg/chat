require "test_helper"

class RoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get join_room" do
    get rooms_join_room_url
    assert_response :success
  end
end
