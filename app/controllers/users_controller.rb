class UsersController < ApplicationController
  # before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    authorize! :show, @user
  end

  def update
    authenticate_user!
    @user = current_user
    @user.update_attributes(user_params)
      redirect_to current_user_path
  end

  def user
    authenticate_user!
    @user = current_user
  end

  private 
    def user_params
      params.require(:user).permit(:mobile, :job, :major)
    end
end
