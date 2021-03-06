require 'test_helper'

class Api::V1::MerchantsControllerTest < ActionController::TestCase

  test '#index responds to json' do
    FactoryGirl.create(:merchant)
    get :index, format: :json
    assert_response :success
  end

  test '#index returns the correct number of merchants' do
    merchants = FactoryGirl.create_list(:merchant, 2)
    get :index, format: :json
    assert_equal merchants.count, json_response.count
  end

  test '#show responds to json' do
    merchant = FactoryGirl.create(:merchant)
    get :show, format: :json, id: merchant.id
    assert_response :success
  end

  test '#show returns a single merchant record' do
    merchant = FactoryGirl.create(:merchant)
    get :show, format: :json, id: merchant.id
    assert_kind_of Hash, json_response
  end

  test '#show returns the correct merchant' do
    merchant = FactoryGirl.create(:merchant)
    get :show, format: :json, id: merchant.id
    assert_equal merchant.id, json_response["id"]
  end

  test '#find responds to json' do
    merchant = FactoryGirl.create(:merchant)
    get :find, format: :json, id: merchant.id
    assert_response :success
  end

  test '#find returns a single record' do
    merchant = FactoryGirl.create(:merchant)
    get :find, format: :json, id: merchant.id
    assert_equal merchant.id, json_response["id"]
    assert_kind_of Hash, json_response
  end

  test '#find returns the correct merchant' do
    merchant = FactoryGirl.create(:merchant)
    get :find, format: :json, id: merchant.id
    assert_equal merchant.id, json_response["id"]
  end

  test '#find_all responds to json' do
    merchant = FactoryGirl.create(:merchant)
    get :find_all, format: :json, id: merchant.id
    assert_response :success
  end

  test '#find_all returns all matching records' do
    merchant = FactoryGirl.create(:merchant)
    get :find_all, format: :json, id: merchant.id
    assert_equal merchant.id, json_response.first["id"]
    assert_equal 1, json_response.count
  end

  test '#random responds to json' do
    FactoryGirl.create(:merchant)
    get :random, format: :json
    assert_response :success
  end

  test '#items responds to json' do
    merchant = FactoryGirl.create(:merchant)
    get :items, format: :json, id: merchant.id
    assert_response :success
  end

  test '#items returns all relevant merchant item records' do
    merchant = FactoryGirl.create(:merchant)
    items = FactoryGirl.create_list(:item, 45, merchant: merchant)
    get :items, format: :json, id: merchant.id
    assert_equal merchant.id, json_response.first["merchant_id"]
    assert_equal 45, json_response.count
  end

  test '#invoices responds to json' do
    merchant = FactoryGirl.create(:merchant)
    get :invoices, format: :json, id: merchant.id
    assert_response :success
  end

  test '#invoices returns all relevant merchant invoice records' do
    FactoryGirl.
    invoices = FactoryGirl.create_list(:invoice, 12, merchant: merchant)
    get :invoices, format: :json, id: merchant.id
    assert_equal merchant.id, json_response.first["merchant_id"]
    assert_equal 12, json_response.count
  end

  test "revenue responds to json" do
    merchant = FactoryGirl.create(:merchant)
    invoice  = FactoryGirl.create(:invoice, merchant: merchant)
    FactoryGirl.create(:transaction, invoice: invoice)
    get :revenue, format: :json, id: merchant.id
    require 'pry'; binding.pry
    assert_response :success
  end

# FactoryGirl.create(:merchant, name: "Edgar's Store")
 #### NEED TO FIX WITH FACTORY ABOVE

  test '#most_revenue responds to json' do
    skip
    merchant = create(:merchant)
    item     = create(:item, merchant: merchant)
    item2    = create(:item, merchant: merchant)
    invoice  = create(:invoice, merchant: merchant)
    create(:invoice_item, item: item, invoice: invoice, unit_price: 100, quantity: 1)
    create(:invoice_item, item: item2, invoice: invoice, unit_price: 100, quantity: 1)

    merchant_adam = create(:merchant, name: "Adam's Store")
    item     = create(:item, merchant: merchant)
    item2    = create(:item, merchant: merchant)
    invoice  = create(:invoice, merchant: merchant)
    create(:invoice_item, item: item, invoice: invoice, unit_price: 200, quantity: 1)
    create(:invoice_item, item: item2, invoice: invoice, unit_price: 600, quantity: 2)

    merchant_elliot = create(:merchant, name: "Elliot's Store")
    item     = create(:item, merchant: merchant)
    item2    = create(:item, merchant: merchant)
    invoice  = create(:invoice, merchant: merchant)
    create(:invoice_item, item: item, invoice: invoice, unit_price: 200, quantity: 1)
    create(:invoice_item, item: item2, invoice: invoice, unit_price: 800, quantity: 1)

    get :most_revenue, format: :json, quantity: 2
    assert_equal 2, json_response.count
    assert_equal [merchant_adam.id, merchant_elliot.id], json_response.map { |response| response["id"] }
  end

  test "#revenue returns total revenue for merchants across transactions" do
    skip
    merchant = FactoryGirl.create(:merchant)
    item     = FactoryGirl.create(:item, merchant: merchant)
    item2    = FactoryGirl.create(:item, merchant: merchant)
    invoice  = FactoryGirl.create(:invoice, merchant: merchant)
    FactoryGirl.create(:invoice_item, item: item, invoice: invoice, unit_price: 100, quantity: 1)
    FactoryGirl.create(:invoice_item, item: item2, invoice: invoice, unit_price: 100, quantity: 1)

  end
end
