class Api::V1::InvoiceItemsController < ApplicationController

  respond_to :json

  def index
    respond_with InvoiceItem.all
  end

  def show
    respond_with InvoiceItem.find_by(id: params[:id])
  end

  def find
    respond_with InvoiceItem.find_by(invoice_item_params)
  end

  def find_all
    respond_with InvoiceItem.where(invoice_item_params)
  end

private

  def invoice_item_params
    params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
  end

end
