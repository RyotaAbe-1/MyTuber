class Public::UsersController < ApplicationController
  def index
    @users = User.where.not(id: current_user.id).includes(:genres)
    @genres = Genre.where(application_status: true)
    @user_profile = User.find(params[:user_id])
    sort = params[:sort]
    if sort == "followings"
      @users = @user_profile.followings.includes(:genres)
    elsif sort == "followers"
      @users = @user_profile.followers.includes(:genres)
    end
  end

  def show
    user = User.find(params[:id])
    @youtubers = Youtuber.where(user_id: user.id).includes(:genre, :comments, :favorites)
    @user_profile = User.find(params[:id])
    @genres = Genre.where(application_status: true)
  end

  def edit
    @user = User.find(params[:id])
    @genres = Genre.where(application_status: true)
    @user_genre = @user.user_genres.build
  end

  def update
    if params[:user][:genre]
      UserGenre.where(user_id: current_user.id).destroy_all
      params[:user][:genre].each do |key, value|
        if value == "true"
          genre_id = Genre.find_by(genre_name: key).id
          UserGenre.create(user_id: current_user.id, genre_id: genre_id)
        end
      end
    end
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    elsif
      @genres = Genre.where(application_status: true)
      @user_genre = @user.user_genres.build
      render :edit
    end
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
