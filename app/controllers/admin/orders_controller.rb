class Admin::OrdersController < AdminController
  def index
  	@order = Order.all
  end
end
