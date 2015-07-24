class HomeController < ApplicationController
  def index
    @novels = Novel.all
  end
end
