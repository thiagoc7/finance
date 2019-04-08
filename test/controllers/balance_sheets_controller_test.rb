require 'test_helper'

class BalanceSheetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get balance_sheets_index_url
    assert_response :success
  end

end
