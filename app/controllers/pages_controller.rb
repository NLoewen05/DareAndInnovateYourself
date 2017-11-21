class PagesController < ApplicationController

  def index
    @enable_pages_menu = true
    @categories = Category.all
    @featured_categories = Category.where(id: User.pluck(:id).sample(5))
  end

  def show
    @enable_pages_menu = true
    @page = params[:page]
    render "pages/#{@page}"
  end

end
