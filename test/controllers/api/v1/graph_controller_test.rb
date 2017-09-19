require 'test_helper'

class Api::V1::GraphControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get api_v1_graph_show_url
    assert_response :success
  end

end
