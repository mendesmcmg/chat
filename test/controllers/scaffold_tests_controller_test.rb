require "test_helper"

class ScaffoldTestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scaffold_test = scaffold_tests(:one)
  end

  test "should get index" do
    get scaffold_tests_url, as: :json
    assert_response :success
  end

  test "should create scaffold_test" do
    assert_difference("ScaffoldTest.count") do
      post scaffold_tests_url, params: { scaffold_test: { text: @scaffold_test.text, user_id: @scaffold_test.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show scaffold_test" do
    get scaffold_test_url(@scaffold_test), as: :json
    assert_response :success
  end

  test "should update scaffold_test" do
    patch scaffold_test_url(@scaffold_test), params: { scaffold_test: { text: @scaffold_test.text, user_id: @scaffold_test.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy scaffold_test" do
    assert_difference("ScaffoldTest.count", -1) do
      delete scaffold_test_url(@scaffold_test), as: :json
    end

    assert_response :no_content
  end
end
