class AuthorsController < ApplicationController
  before_action :authenticate_user!
  # load_and_authorize_resource

  def create
    @author = current_user.create_author(author_params)
    @author.status = 0
    @author.user_id = current_user.id
    if @author.save
      flash[:success] = "您已提交申请"
    else
      flash[:error] = "提交失败"
    end
    redirect_to current_author_path

  end

  def show
    @user = current_user
    @author = Author.find(params[:id])
    @novels = @author.novels if @author
  end

  def author
    @user = current_user
    @author = current_author
    @novels = @author.novels if @author
    # render 'show'
  end

  private 
    def author_params
      params.require(:author).permit(:name, :mobile, :job, :major, :description)
    end

end
