require "test_helper"

class CsvControllerTest < ActionDispatch::IntegrationTest
  test "should get tojson" do
    get csv_tojson_url
    assert_response :success
  end
end
