class PagesController < ApplicationController

  def index
  end

  def show
    @page = params[:page]
    render "pages/#{@page}"
  end

  
end
