class ChaptersController < ApplicationController
  # before_action :authenticate_user!

  def index
    @chapters = Novel.find(params[:novel_id]).chapters
  end

  def new
    authenticate_author!
    @novel = Novel.find(params[:novel_id])
    @chapter = @novel.chapters.new
  end

  def create
    authenticate_author!
    @novel = Novel.find(params[:novel_id])
    @chapter = @novel.chapters.build(chapter_params)
    @chapter.novel_id = @novel.id
    @chapter.save
    redirect_to current_author_path
  end

  def edit
    authenticate_author!
    @novel = Novel.find(params[:novel_id])
    @chapter = @novel.chapters.find(params[:id])
  end

  def update
    authenticate_author!
    @novel = Novel.find(params[:novel_id])
    @chapter = @novel.chapters.find(params[:id])
    if @chapter.update(chapter_params)
      flash[:success] = "您已成功更新章节资料"
      redirect_to current_author_path
    else
      flash[:error] = "更新失败"
      render 'edit'
    end
  end

  def show
    @novel = Novel.find(params[:novel_id])
    @chapter = @novel.chapters.find(params[:id])
  end

  private
    def chapter_params
      params.require(:chapter).permit(:number, :name, :content, :keywords)
    end
end
