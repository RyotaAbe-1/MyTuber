class Admin::UsersController < ApplicationController
  def index
    @users = User.all.includes(:genres)
    @genres = Genre.where(application_status: true)
  end

  def show
    user = User.find(params[:id])
    @youtubers = Youtuber.where(user_id: user.id).includes(:genre, :comments, :favorites)
    @user_profile = User.find(params[:id])
    @genres = Genre.where(application_status: true)
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    page = params[:page]
    if page == "post-show"
      youtuber = Youtuber.find(params[:youtuber_id])
      redirect_to admin_youtuber_path(youtuber)
    elsif page == "user-show"
      redirect_to admin_user_path(user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:is_active)
  end

end
