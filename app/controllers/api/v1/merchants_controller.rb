class Api::V1::MerchantsController < Api::V1::BaseController

  respond_to :json

  def index
    respond_with Merchant.all
  end

  def show
    respond_with Merchant.find_by(id: params[:id])
  end

  def find
    respond_with Merchant.find_by(merchant_params)
  end

  def find_all
    respond_with Merchant.where(merchant_params)
  end

  def random
    respond_with Merchant.order("RANDOM()").first
  end

  def items
    respond_with Merchant.find_by(id: params[:id]).items
  end

  def invoices
    respond_with Merchant.find_by(id: params[:id]).invoices
  end

  # def revenue
  #
  #   respond_with Invoice.where(merchant_id: params[:id]).joins(:invoice_items).sum("invoice_items.quantity *     invoice_items.unit_price")
  # end

  def revenue
   invoice_ids = Merchant.find(params[:id]).invoices.pluck(:id)
   paid_invoice_ids = Transaction.where(invoice_id: invoice_ids).where(result: "success").pluck(:invoice_id)
   respond_with({"revenue" => InvoiceItem.where(invoice_id: paid_invoice_ids).sum("unit_price * quantity")})
 end

private

  def merchant_params
    params.permit(:id, :name, :created_at, :updated_at)
  end

end
