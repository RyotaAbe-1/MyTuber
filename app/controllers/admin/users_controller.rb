class Admin::UsersController < ApplicationController
  def index
    @users = User.all.includes(:genres)
    @genres = Genre.where(application_status: true)
    sort = params[:sort]
    if sort == "followings"
      @user_profile = User.find(params[:user_id])
      @users = @user_profile.followings.includes(:genres)
      @youtubers = Youtuber.where(user_id: @user_profile.id).includes(:genre, :comments, :favorites)
    elsif sort == "followers"
      @user_profile = User.find(params[:user_id])
      @users = @user_profile.followers.includes(:genres)
      @youtubers = Youtuber.where(user_id: @user_profile.id).includes(:genre, :comments, :favorites)
    end
  end

  def show
    @user_profile = User.find(params[:id])
    @genres = Genre.where(application_status: true)
    @youtubers = Youtuber.where(user_id: @user_profile.id).includes(:genre, :comments, :favorites)
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to request.referer
  end

  private

  def user_params
    params.require(:user).permit(:is_active)
  end

end
