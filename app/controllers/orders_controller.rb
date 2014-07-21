class OrdersController < ApplicationController
  before_action :authenticate_user!
 
  def create
    @order = current_user.orders.build(order_params)
    @cart = current_cart

    if @order.save
      OrderPlacingService.new(current_cart, @order).place_order!
      redirect_to order_path(@order.token)
    else
      render "carts/checkout"
    end
  end
 
  def pay_with_credit_card
  	@order = current_user.orders.find_by_token(params[:id])
  end

  def show
    @order = current_user.orders.find_by_token(params[:id])
    @order_info = @order.info
    @order_items = @order.items
  end

  def cancel
    @order = current_user.orders.find_by_token(params[:id])
    @order.cancel_the_order!
    #為何更改訂單狀態一定需要加驚嘆號？
    redirect_to account_orders_path 
  end

  private
 
  def order_params
    params.require(:order).permit(:info_attributes => [:billing_name, :billing_address,:shipping_name, :shipping_address] )
  end
end
