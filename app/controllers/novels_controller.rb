class NovelsController < ApplicationController
  def new
    # byebug
    @novel = Novel.new()
  end

  def create
    @novel = current_author.novels.build(novel_params)
    @novel.author_id = current_author.id
    @novel.save
    redirect_to current_user_path
  end

  private 
    def novel_params
      params.require(:novel).permit(:name, :type, :cover, :keywords, :description)
    end

end
