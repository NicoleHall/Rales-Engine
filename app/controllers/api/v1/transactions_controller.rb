class Api::V1::TransactionsController < ApplicationController

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

private

  def transaction_params
    params.require(:transaction).permit(:customer_id, :merchant_id, :status, :created_at, :updated_at)
  end

end