class BillsController < ApplicationController
  before_action :authenticate_user!
  def show
    render json: {data: @current_user.bills}, status: :ok
  end

  def create
    render json: {data: @current_user.bills.create!(create_params)}, status: :ok
  end

  def update
    render json: {}, status: :ok
  end
  
  def destroy
    render json: {data: @current_user.bills.where(id: destroy_params.bill_id).destroy_all}, status: :ok
  end

  private

  def create_params
    params.permit(:bill_number, :amount, :date, :bill_type)
  end

  def destroy_params
    params.permit(:bill_id)
  end
end