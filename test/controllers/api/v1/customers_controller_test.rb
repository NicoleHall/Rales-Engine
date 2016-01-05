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

  test "should post customer create" do
    skip
    customers_count = Customer.count
    post :create, format: :json, first_name: "Nicole", last_name: "Hall"


    assert_response :success
    assert_equal((customers_count + 1), Customer.count)
  end




end
