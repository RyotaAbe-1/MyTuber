class Public::UsersController < ApplicationController
  include CommonActions
  before_action :set_genres, except: [:confirm, :widhdraw]
  before_action :set_user_profile, except: [:index, :confirm, :widhdraw]

  def index
    @users = User.where.not(id: current_user.id).page(params[:page]).includes(:genres)
    @user_profile = User.find(params[:user_id])
    sort = params[:sort]
    if sort == "followings"
      @users = @user_profile.followings.page(params[:page]).includes(:genres)
    elsif sort == "followers"
      @users = @user_profile.followers.page(params[:page]).includes(:genres)
    end
  end

  def show
    @youtubers = Youtuber.where(user_id: @user_profile.id).page(params[:page]).per(10).includes(:genre, :comments, :favorites)
  end

  def edit
    @user_genre = @user_profile.user_genres.build
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

    if @user_profile.update(user_params)
      redirect_to user_path(@user_profile)
    elsif
      @user_genre = @user_profile.user_genres.build
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
