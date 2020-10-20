require 'test_helper'

class UserRecipiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_recipies_index_url
    assert_response :success
  end

end
