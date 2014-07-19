class OrderItem < ActiveRecord::Base
	def item_total_price
		price * quantity
	end
end
