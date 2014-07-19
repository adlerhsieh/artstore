class CartItemsController < ApplicationController

def update
	@cart = current_cart
	@item = @cart.cart_items.find(params[:id])

	@item.update(item_params)

	redirect_to carts_path
end

def destroy
	@cart = current_cart
	@item = @cart.cart_items.find_by(:product_id => params[:id])
	@item.destroy
	redirect_to :back
end

private
def item_params
	params.require(:cart_items).permit(:quantity)
end

end
