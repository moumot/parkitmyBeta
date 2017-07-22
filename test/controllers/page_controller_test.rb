require 'test_helper'

class PageControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get page_home_url
    assert_response :success
  end

  test "should get search" do
    get page_search_url
    assert_response :success
  end

  test "should get signup" do
    get page_signup_url
    assert_response :success
  end

  test "should get howitworks" do
    get page_howitworks_url
    assert_response :success
  end

  test "should get dlanding" do
    get page_dlanding_url
    assert_response :success
  end

  test "should get olanding" do
    get page_olanding_url
    assert_response :success
  end

  test "should get dmanage" do
    get page_dmanage_url
    assert_response :success
  end

  test "should get omanage" do
    get page_omanage_url
    assert_response :success
  end

  test "should get profile" do
    get page_profile_url
    assert_response :success
  end

  test "should get help" do
    get page_help_url
    assert_response :success
  end

  test "should get contact" do
    get page_contact_url
    assert_response :success
  end

  test "should get leasing" do
    get page_leasing_url
    assert_response :success
  end

  test "should get bookingdetails" do
    get page_bookingdetails_url
    assert_response :success
  end

  test "should get aboutus" do
    get page_aboutus_url
    assert_response :success
  end

  test "should get faq" do
    get page_faq_url
    assert_response :success
  end

  test "should get blog" do
    get page_blog_url
    assert_response :success
  end

  test "should get success1" do
    get page_success1_url
    assert_response :success
  end

  test "should get success2" do
    get page_success2_url
    assert_response :success
  end

  test "should get success3" do
    get page_success3_url
    assert_response :success
  end

  test "should get success4" do
    get page_success4_url
    assert_response :success
  end

  test "should get tnc" do
    get page_tnc_url
    assert_response :success
  end

end
