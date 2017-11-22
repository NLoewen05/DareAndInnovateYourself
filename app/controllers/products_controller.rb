class ProductsController < ApplicationController
  before_action :initialize_actions

  def index
  end

  def show
    @shop = Shop.find(params[:shop_id])
    @product = Product.find(params[:id])
    @product_skus = @product.skus
  end

  def initialize_actions
    @categories = Category.all
    @enable_pages_menu = true
  end
end
