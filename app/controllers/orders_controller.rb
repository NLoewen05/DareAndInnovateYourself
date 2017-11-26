class OrdersController < ApplicationController
  before_action :initialize_actions
  before_action :initialize_shopping_cart

  def new
    @order = Order.new
    @cart_skus = Sku.find(session[:shopping_cart])
  end

  def add_to_cart
    sku = Sku.find(params[:id])

    session[:shopping_cart] << sku.id unless session[:shopping_cart].include?(sku.id)

    redirect_back fallback_location: root_path, notice: "#{sku.product.name} added to Cart"
  end

  def initialize_shopping_cart
    session[:shopping_cart] ||= []
  end

  def initialize_actions
    @enable_pages_menu = true
  end
end
