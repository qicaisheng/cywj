class ChapterCommentsController < ApplicationController
  def create
    authenticate_user!
    @chapter = Chapter.find(params[:chapter_id])
    @chapter_comment = @chapter.chapter_comments.create(chapter_comment_params)
    @chapter_comment.user_id = current_user.id
    @chapter_comment.novel_id = @chapter.novel.id
    if @chapter_comment.save
      flash[:success] = "评论成功"
    else
      flash[:error] = "评论失败"
    end
    redirect_to novel_chapter_path(@chapter.novel, @chapter)
  end

  private
    def chapter_comment_params
      params.require(:chapter_comment).permit(:content)
    end
end
