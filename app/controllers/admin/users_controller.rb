class Admin::UsersController < ApplicationController
  skip_before_action :authenticate_user!
  
  include CommonActions
  before_action :set_genres, except: [:update]
  before_action :set_user_profile, only: [:show]
  
  def index
    sort = params[:sort]
    if sort == "followings"
      @user_profile = User.find(params[:user_id])
      @users = @user_profile.followings.page(params[:page]).includes(:genres).order("relationships.created_at DESC")
    elsif sort == "followers"
      @user_profile = User.find(params[:user_id])
      @users = @user_profile.followers.page(params[:page]).includes(:genres).order("relationships.created_at DESC")
    else
      @users = User.page(params[:page]).includes(:genres)
    end
  end

  def show
    @youtubers = Youtuber.where(user_id: @user_profile.id).page(params[:page]).per(10).includes(:genre, :comments, :favorites).order("created_at DESC")
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
