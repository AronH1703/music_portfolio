require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get home_url
    assert_response :success
  end

  test "index should include ARON and HANNES titles" do
    get home_url
    assert_select "h1.title-aron", "ARON"
    assert_select "h1.title-hannes", "HANNES"
  end
end
