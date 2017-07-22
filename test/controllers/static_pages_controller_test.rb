require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @title_root = "Go-Tweeter"
  end

  test "should get home" do
    get static_pages_home_url
    assert_response :success
    assert_select "title", "#{@title_root}"
  end

  test "should get contact us" do
    get static_pages_contactus_url
    assert_response :success
    assert_select "title", "Contact Us | #{@title_root}"
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
    assert_select "title", "About | #{@title_root}"
  end

  test "should get root" do
    get root_url
    assert_response :success
  end
end
