require 'test_helper'
class Api::V1::CustomersControllerTest < ActionController::TestCase

  def setup
    @customer = customers(:one)
  end


  test "should get customer index" do
    get :index, format: :json
    assert_response :success
  end

  test "should get customer show" do
    get :show, format: :json, id: @customer.id
    assert_response :success
  end

  test "should find customer show" do
    get :show, format: :json, id: @customer.id
    assert_response :success
  end

end
