class CategoriesController < ApplicationController

  def show
    @disable_view_all_link = true
    @enable_pages_menu = true
    @category = Category.find(params[:id])
  end
end
