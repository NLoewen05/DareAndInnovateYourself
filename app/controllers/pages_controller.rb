class PagesController < ApplicationController

  def index
    @categories = Category.all
    @featured_categories = Category.where(id: User.pluck(:id).sample(5))
    
  end

  def show
    @disable_pages_menu = true
    @page = params[:page]
    render "pages/#{@page}"
  end

end
