require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get music" do
    get pages_music_url
    assert_response :success
  end
end
