class OrdersController < ApplicationController
  before_action :initialize_actions
  before_action :initialize_shopping_cart

  def new
    @order = Order.new

    session[:shopping_cart].each do |item|
      sku = Sku.find(item['sku_id'])
      @order.line_items.build(sku: sku, price: sku.price, quantity: item['quantity'])
    end

  end

  def create

  end

  def add_to_cart
    sku = Sku.find(params[:id])
    quantity = params[:quantity]

    session[:shopping_cart] << {sku_id: sku.id, quantity: quantity} unless (session[:shopping_cart].collect {|i| i['sku_id']} ).include?(sku.id)

    redirect_back fallback_location: root_path, notice: "#{sku.product.name} added to your Cart."
  end

  def update_cart_item_quantity
    sku = Sku.find(params[:id])
    quantity = params[:quantity]

    session[:shopping_cart].each_with_index do |item, i|
      next unless item['sku_id'] == sku.id
      session[:shopping_cart][i]['quantity'] = quantity
    end
  end

  def delete_from_cart
    sku = Sku.find(params[:id])

    session[:shopping_cart].each_with_index do |item, i|
      next unless item['sku_id'] == sku.id
      session[:shopping_cart].delete_at(i)
    end

    redirect_back fallback_location: root_path, notice: "#{sku.product.name} has been deleted from your Cart."
  end

  def delete_all_from_cart
    session[:shopping_cart] = []
    redirect_back fallback_location: root_path, notice: "Deleted all items from your cart."
  end

  def initialize_shopping_cart
    session[:shopping_cart] ||= []
  end

  def initialize_actions
    @enable_pages_menu = true
  end
end
