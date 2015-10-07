require 'test_helper'

class LabstaffControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

end
