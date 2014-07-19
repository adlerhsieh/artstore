module OrdersHelper
	def render_order_item_total_price(this)
		this.item_total_price
	end

	def render_order_state(state)
		case state
		when "paid"
			"已付款"
		when "shipping"
			"已發貨"
		when "shipped"
			"已送達"
		when "order_cancelled"
			"訂單取消"
		when "good_returned"
			"辦理退貨"
		else
			"待付款"
		end
	end
end
