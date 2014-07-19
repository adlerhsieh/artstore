class CartsController < ApplicationController
	before_action :authenticate_user!, :only => [:checkout]

	def index
		@cart = current_cart.items.all
	end

	def checkout
		@order = current_user.orders.build
		@info = @order.build_info
		#build和model_build兩個是相反過來的
	end

	def clean
		@cart = current_cart
		@item = @cart.cart_items
		@item.delete_all
		redirect_to carts_path
	end

end
