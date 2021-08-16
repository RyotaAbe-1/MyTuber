class Public::UsersController < ApplicationController
  def index
    @users = User.where.not(id: current_user.id)
    @user_profile = User.find(current_user.id)
    @genres = Genre.where(application_status: true)
  end

  def show
    @youtubers = Youtuber.where(user_id: current_user.id)
    @user_profile = User.find(params[:id])
    @genres = Genre.where(application_status: true)
  end

  def edit
    @user = User.find(params[:id])
    @genres = Genre.where(application_status: true)
    @user_genre = @user.user_genres.build
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user)
  end

  private

  # ???
  def user_params
    params.require(:user).permit(:user_name, :image, :introduce, user_genres_attributes: [:genre_ids])
  end
end
