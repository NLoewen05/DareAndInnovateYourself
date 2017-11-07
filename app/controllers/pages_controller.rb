class PagesController < ApplicationController

  def index
    @categories = Category.all
    @products = Product.all
  end

  def show
    @page = params[:page]
    render "pages/#{@page}"
  end

  
end
