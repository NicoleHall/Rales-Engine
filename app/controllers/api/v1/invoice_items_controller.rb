class Api::V1::InvoiceItemsController < Api::V1::BaseController

  respond_to :json

  def index
    respond_with InvoiceItem.all
  end

  def show
    thing = JSON.parse(InvoiceItem.find_by(id: params[:id]).to_json)
    # thing["unit_price"] = (thing["unit_price"].to_f / 100).to_s
    thing["unit_price"] = '%.2f' % (thing["unit_price"].to_f / 100)
    respond_with thing.to_json

  end

  def find
    respond_with InvoiceItem.find_by(invoice_item_params)
  end

  def find_all
    respond_with InvoiceItem.where(invoice_item_params)
  end

  def random
    respond_with InvoiceItem.order("RANDOM()").first
  end

  def invoice
    respond_with InvoiceItem.find_by(invoice_item_params).invoice
  end

  def item
    respond_with InvoiceItem.find_by(invoice_item_params).item
  end

private

  def invoice_item_params
    params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
  end

end
