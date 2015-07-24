class HomeController < ApplicationController
  def index
    @novels = Novel.where("is_show = ?", true)
  end
end
