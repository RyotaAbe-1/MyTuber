class Public::UsersController < ApplicationController
  def index
    @users = User.includes(:genres).where.not(id: current_user.id)
    @user_profile = User.find(current_user.id)
    @genres = Genre.where(application_status: true)
  end

  def show
    user = User.find(params[:id])
    @youtubers = Youtuber.where(user_id: user.id)
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
    if params[:user][:genre]
      UserGenre.where(user_id: current_user.id).destroy_all
      params[:user][:genre].each do |key, value|
        if value == "true"
          genre_id = Genre.find_by(genre_name: key).id
          UserGenre.create(user_id: current_user.id, genre_id: genre_id)
        end
      end
    end
    redirect_to user_path(user)
  end

  def confirm
  end

  def withdraw
    user = User.find(current_user.id)
    user.update(is_active: "false")
    reset_session
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :image, :introduce)
  end
end
