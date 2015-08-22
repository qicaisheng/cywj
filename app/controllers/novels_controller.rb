class NovelsController < ApplicationController
  def index
    @novels = Novel.all
  end

  def current_novels
    authenticate_author!
    @novels = current_author.novels if current_author
  end

  def current_chapters
    authenticate_author!
    @novel = Novel.find(params[:id])
    @chapters = @novel.chapters
  end

  def new
    authenticate_author!
    # byebug
    @novel = Novel.new()
  end

  def create
    authenticate_author!
    @novel = current_author.novels.build(novel_params)
    @novel.author_id = current_author.id
    if @novel.save
      flash[:success] = "您已成功添加书籍"
      redirect_to current_author_path
    else
      flash[:error] = "添加失败"
      render 'new'
    end
  end

  def edit
    authenticate_author!
    @novel = Novel.find(params[:id])
    authorize! :edit, @novel
  end

  def update
    authenticate_author!
    @novel = Novel.find(params[:id])
    authorize! :update, @novel
    if @novel.update(novel_params)
      flash[:success] = "您已成功更新书籍资料"
      redirect_to current_author_path
    else
      flash[:error] = "更新失败"
      render 'edit'
    end
  end

  def show
    @novel = Novel.find(params[:id])
    @chapters = @novel.chapters
  end

  private 
    def novel_params
      params.require(:novel).permit(:name, :type, :cover, :keywords, :description)
    end

end
