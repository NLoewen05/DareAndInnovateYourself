class ShopController < ApplicationController


  def show
    @shop = params[:id]
    

  end
end
