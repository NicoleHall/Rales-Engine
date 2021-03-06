class Api::V1::CustomersController < Api::V1::BaseController

  respond_to :json

  def index
    respond_with Customer.all
  end

  def show
    respond_with Customer.find_by(id: params[:id])
  end

  def find
    respond_with Customer.find_by(customer_params)
  end

  def find_all
    respond_with Customer.where(customer_params)
  end

  def invoices
    respond_with Customer.find_by(id: params[:id]).invoices
  end

  def random
    respond_with Customer.order("RANDOM()").first
  end

  def transactions
    respond_with Customer.find_by(id: params[:id]).transactions
  end

  def favorite_merchant
    respond_with Merchant.find(Invoice.joins(:transactions).where(transactions: {result: "success"}, customer_id: params[:id]).group(:merchant_id).count.max_by { |k,v| v }.first)
  end

private

  def customer_params
    params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
  end

end
