require "test_helper"

class XlsxControllerTest < ActionDispatch::IntegrationTest
  test "should get tojson" do
    get xlsx_tojson_url
    assert_response :success
  end
end
