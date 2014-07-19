module ApplicationHelper
	def render_admin_url
		if current_user.is_admin
			link_to("管理後台", admin_products_path, :class => "btn btn-default")
		end
	end

	def render_cart_url
		link_to("購物車 (#{cart_items_count(current_cart)})", carts_path, :class => "btn btn-default")
	end
end
