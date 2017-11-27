class ProductsController < ApplicationController
  before_action :initialize_actions

  def index
    @json_response = {
      "products": []
    }

    @products = Product.order(:created_at).page(params[:page])

    @json_response['products'] = @products
    
    respond_to do |format|
      format.html
      format.json { render json: @json_response, include: [:skus => {methods: [:picture_url]}, :category => {only: :name}] }
    end
  end

  def show
    @shop = Shop.find(params[:shop_id])
    @product = Product.includes(:skus, :options).find(params[:id])
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
