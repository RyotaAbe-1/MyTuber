class Admin::UsersController < ApplicationController
  def index
    @genres = Genre.where(application_status: true)
    sort = params[:sort]
    if sort == "followings"
      @user_profile = User.find(params[:user_id])
      @users = @user_profile.followings.page(params[:page]).includes(:genres)
      @youtubers = Youtuber.where(user_id: @user_profile.id).includes(:genre, :comments, :favorites)
    elsif sort == "followers"
      @user_profile = User.find(params[:user_id])
      @users = @user_profile.followers.page(params[:page]).includes(:genres)
      @youtubers = Youtuber.where(user_id: @user_profile.id).includes(:genre, :comments, :favorites)
    else
      @users = User.page(params[:page]).includes(:genres)
    end
  end

  def show
    @user_profile = User.find(params[:id])
    @genres = Genre.where(application_status: true)
    @youtubers = Youtuber.where(user_id: @user_profile.id).page(params[:page]).per(10).includes(:genre, :comments, :favorites)
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
