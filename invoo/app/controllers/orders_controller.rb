class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def index
    @orders = Order.where(company_id: params[:company_id])
  end

  # def create
  #   session[:current_user_id] = current_user.id
  #   # @order = Order.new(company_id: params[:company_id], user_id: session[:current_user_id])
  #   @order = Order.new(order_params)
  #   @order.save!
  # end
  #   # private

  #   # def order_params
  #   #   params.require(:order).permit(
  #   #     :full_name, :cpf, :rg, :birthday, :phone, :email, :zipcode, :address,
  #   #     :number, :complement, :district, :state_id, :city_id, :link
  #   #   )
  #   # end
  # def order_params
  #   params.require(:order).permit(
  #     :company_name, :cnpj, :zipcode, :address, :number, :complement, :district, :state_id, :city_id, :link)
  # end
end
