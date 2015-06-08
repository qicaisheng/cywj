class AuthorsController < ApplicationController
  def new
    # @author = current_user.build_author
  end

  def create
    @author = current_user.create_author(author_params)
    @author.is_apply_for = true
    @author.user_id = current_user.id
    if @author.save
      flash[:success] = "您已提交申请"
    else
      flash[:error] = "ddd"
    end
    redirect_to current_author_path

  end

  def show
    if request.env['PATH_INFO'] == "/author"
      @user = current_user
      @author = @user.author
    else
      @author =  Author.find(params[:id])
      @user = @author.user
    end

    @author = request.env['PATH_INFO'] == "/author" ? current_user.author : Author.find(params[:id])
  end

  private 
    def author_params
      params.require(:author).permit(:mobile, :job, :major, :description)
    end

end
