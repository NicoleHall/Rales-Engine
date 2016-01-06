# require 'test_helper'
# class Api::V1::CustomersControllerTest < ActionController::TestCase
#
#   def setup
#     @customer = customers(:one)
#   end
#
#
#   test "should get customer index" do
#     get :index, format: :json
#     assert_response :success
#   end
#
#   test "should get customer show" do
#     get :show, format: :json, id: @customer.id
#     assert_response :success
#   end
#
#   test "should find customer show" do
#     get :show, format: :json, id: @customer.id
#     assert_response :success
#   end
# end

require 'test_helper'

class Api::V1::CustomersControllerTest < ActionController::TestCase

  test '#index responds to json' do
    FactoryGirl.create(:customer)
    get :index, format: :json
    assert_response :success
  end

  test '#index returns an array of records' do
    FactoryGirl.create(:customer)
    get :index, format: :json
    assert_kind_of Array, json_response
  end

  test '#index returns the correct number of customers' do
    customers =  FactoryGirl.create_list(:customer, 2)
    get :index, format: :json
    assert_equal customers.count, json_response.count
  end

  test '#show responds to json' do
    customer =  FactoryGirl.create(:customer)
    get :show, format: :json, id: customer.id
    assert_response :success
  end

  test '#show returns a single record' do
    customer =  FactoryGirl.create(:customer)
    get :show, format: :json, id: customer.id
    assert_kind_of Hash, json_response
  end

  test '#show returns the correct item' do
    customer =  FactoryGirl.create(:customer)
    get :show, format: :json, id: customer.id
    assert_equal customer.id, json_response["id"]
  end

  test '#find responds to json' do
    customer =  FactoryGirl.create(:customer)
    get :find, format: :json, first_name: customer.first_name
    assert_response :success
  end

  test '#find returns a single record' do
    customer =  FactoryGirl.create(:customer)
    get :find, format: :json, first_name: customer.first_name
    assert_kind_of Hash, json_response
  end

  test '#find returns the correct item' do
    customer =  FactoryGirl.create(:customer)
    get :find, format: :json, id: customer.id
    assert_equal customer.id, json_response["id"]
  end

  test '#find_all responds to json' do
    customer =  FactoryGirl.create(:customer)
    get :find_all, format: :json, first_name: customer.first_name
    assert_response :success
  end

  test '#find_all returns all matching records' do
    customer =  FactoryGirl.create(:customer)
    get :find_all, format: :json, first_name: customer.first_name
    assert_equal 1, json_response.count
  end

  test '#random responds to json' do
    FactoryGirl.create(:customer)
    get :random, format: :json
    assert_response :success
  end

  ########### INVOICES

  test '#invoices responds to json' do
    customer =  FactoryGirl.create(:customer)
    get :invoices, format: :json, id: customer.id
    assert_response :success
  end

  test '#invoices returns specific customer records' do
    skip
    customer =  FactoryGirl.create(:customer)
    get :invoices, format: :json, id: customer.id
    assert_equal 1, json_response.count
  end

  ############## TRANSACTIONS

  test '#transactions responds to json' do
    customer = FactoryGirl.create(:customer)
    get :transactions, format: :json, id: customer.id
    assert_response :success
  end

  test '#transactions returns specific customer records' do
    skip
    customer =  FactoryGirl. FactoryGirl.create(:customer)
    get :transactions, format: :json, id: customer.id
    assert_equal 1, json_response.count
  end
end
