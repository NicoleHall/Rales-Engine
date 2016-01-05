class Api::V1::CustomersController < ApplicationController

  respond_to :json

  def index
    respond_with Customer.all
  end

  def show
    respond_with Customer.find_by(id: params[:id])
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      respond_to do |format|
        format.json {render json: @customer }
      end
    else
      respond_to do |format|
        format.json { render json: @customer.errors.full_messages, status: 400}
      end
    end
  end

private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name)
  end

end
