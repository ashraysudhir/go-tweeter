require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @title_root = "Go-Tweeter"
  end

  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "#{@title_root}"
  end

  test "should get contact us" do
    get contactus_path
    assert_response :success
    assert_select "title", "Contact Us | #{@title_root}"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | #{@title_root}"
  end

end
