class Public::RelationshipsController < ApplicationController
  def follow
    current_user.follow(params[:id])
    page = params[:page]
    if page == "user-index"
      @users = User.where.not(id: current_user.id)
      @user_profile = User.find(current_user.id)
      @genres = Genre.where(application_status: true)
      redirect_to users_path
    end
  end

  def unfollow
    current_user.unfollow(params[:id])
    page = params[:page]
    if page == "user-index"
      @users = User.where.not(id: current_user.id)
      @user_profile = User.find(current_user.id)
      @genres = Genre.where
      redirect_to users_path
    end
  end
end
