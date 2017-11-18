class PagesController < ApplicationController

  def index
    @categories = Category.all
    @featured_categories = Category.where(id: User.pluck(:id).sample(5))
    
  end

  def show
    @page = params[:page]
    render "pages/#{@page}"
  end

end
