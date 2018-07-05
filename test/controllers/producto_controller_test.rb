require 'test_helper'

class ProductoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get producto_index_url
    assert_response :success
  end

end
