class UsersController < ApplicationController
  def show
    @user = request.env['PATH_INFO'] == "/user" ? current_user : User.find(params[:id])
  end

  def update
    @user = current_user
    @user.update_attributes(user_params)
      redirect_to current_user_path
  end

  def author
    @user = current_user

  end

  private 
    def user_params
      params.require(:user).permit(:mobile, :job, :major)
    end
end
