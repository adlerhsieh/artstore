class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_cart

  def admin_required
      if !current_user.is_admin  
        flash[:notice] = "只有管理員能進入該頁面"
        redirect_to products_path
      end
  end

  def current_cart
  	@current_cart ||= find_cart
  end

  def find_cart
  	cart = Cart.find_by(id: session[:cart_id])

  	unless cart.present?
  		cart = Cart.create
  	end

  	session[:cart_id] = cart.id
  	cart
  end

end
