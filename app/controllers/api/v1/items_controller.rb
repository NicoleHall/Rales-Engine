class Api::V1::ItemsController < Api::V1::BaseController

  respond_to :json

  def index
    respond_with Item.order(:id)
  end

  def show
    respond_with Item.find_by(id: params[:id])
  end

  def find
    respond_with Item.order(:id).find_by(item_params)
  end

  def find_all
    respond_with Item.order(:id).where(item_params)
  end

  def random
    respond_with Item.order("RANDOM()").first
  end

  def invoice_items
    respond_with Item.find_by(id: params[:id]).invoice_items
  end

  def merchant
    respond_with Item.find_by(id: params[:id]).merchant
  end

private

  def item_params
    params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
  end

end
