require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "links of site" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contactus_path
  end
  
end
