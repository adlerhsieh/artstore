class Admin::OrdersController < ApplicationController
  def index
  	@order = Order.all
  end
end
