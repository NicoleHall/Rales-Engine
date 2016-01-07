class Api::V1::TransactionsController < Api::V1::BaseController

  respond_to :json

  def index
    respond_with Transaction.all
  end

  def show
    respond_with Transaction.find_by(id: params[:id])
  end

  def find
    respond_with Transaction.find_by(transaction_params)
  end

  def find_all
    respond_with Transaction.where(transaction_params)
  end

  def random
    respond_with Transaction.order("RANDOM()").first
  end

  def invoice
    respond_with Transaction.find_by(id: params[:id]).invoice
  end

private

  def transaction_params
    params.permit(:id, :invoice_id, :credit_card_number, :result, :created_at, :updated_at)
    #this removes the need to do params["transaction"]["status"]
    #you can just do params[status]
  end

end
