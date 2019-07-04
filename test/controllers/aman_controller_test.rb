require 'test_helper'

class AmanControllerTest < ActionDispatch::IntegrationTest
  test "should get kumar" do
    get aman_kumar_url
    assert_response :success
  end

  test "should get dokania" do
    get aman_dokania_url
    assert_response :success
  end

end
