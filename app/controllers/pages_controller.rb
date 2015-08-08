class PagesController < ApplicationController
  def index
    @novels = Novel.where("is_show = ?", true)
  end  
  
  def show
    @page = Page.where(slug: params[:slug]).first
    if @page
      render :show
    else
      raise ActionController::RoutingError.new('Page Not Found')
    end
  end
end
