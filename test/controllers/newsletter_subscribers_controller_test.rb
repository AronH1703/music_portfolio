require "test_helper"

class NewsletterSubscribersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get newsletter_path
    assert_response :success
    assert_select "form"
  end

  test "should create newsletter subscriber with valid email" do
    assert_difference('NewsletterSubscriber.count') do
      post newsletter_path, params: { newsletter_subscriber: { email: "valid@example.com" } }
    end
    assert_redirected_to newsletter_path
    assert_equal "You have successfully subscribed to the newsletter!", flash[:notice]
  end

  test "should not create newsletter subscriber with invalid email" do
    assert_no_difference('NewsletterSubscriber.count') do
      post newsletter_path, params: { newsletter_subscriber: { email: "invalid" } }
    end
    assert_response :success
    assert_match "Email is invalid", response.body
  end

  test "should not create newsletter subscriber with duplicate email" do
    NewsletterSubscriber.create!(email: "duplicate@example.com")
    assert_no_difference('NewsletterSubscriber.count') do
      post newsletter_path, params: { newsletter_subscriber: { email: "duplicate@example.com" } }
    end
    assert_response :success
    assert_match "Email has already been taken", response.body
  end
end
