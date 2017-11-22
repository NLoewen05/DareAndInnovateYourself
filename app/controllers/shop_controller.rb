class ShopController < ApplicationController

  before_action :authenticate_user!

  def new
    @shop = Shop.new
    @shop.products.build
  end

  def create
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def destroy
  end
end
