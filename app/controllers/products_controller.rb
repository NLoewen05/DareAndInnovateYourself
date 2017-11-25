class ProductsController < ApplicationController
  before_action :initialize_actions

  def index
    @json_response = {
      "products": []
    }

    @products = Product.all

    @json_response['products'] = @products
    
    render json: @json_response, include: [:skus, :category => {only: :name}]
  end

  def show
    @shop = Shop.find(params[:shop_id])
    @product = Product.includes(:skus).find(params[:id])
  end

  def search
    @products = params[:cat].nil? || params[:cat] == "0" ? 
    Product.where("LOWER(name) LIKE LOWER('%#{params[:q]}%')") : 
    Product.where("LOWER(name) LIKE LOWER('%#{params[:q]}%')").where(category_id: params[:cat])

    render json: @products
  end

  def initialize_actions
    @enable_pages_menu = true
  end
end
