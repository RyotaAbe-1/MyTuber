class Public::YoutubersController < ApplicationController
  skip_before_action :authenticate_admin!
  include CommonActions
  before_action :set_genres, except: [:destroy]
  before_action :set_current_user_profile, except: [:show, :destroy]

  def new
    @youtuber = Youtuber.new
  end

  def create
    @youtuber = Youtuber.new(youtuber_params)
    @youtuber.user_id = current_user.id
    if @youtuber.save
      redirect_to youtuber_path(@youtuber)
    else
      render :new
    end
  end

  def index
    sort = params[:sort]
    if sort == "timeline"
      user_ids = current_user.followings.select(:followed_id)
      @youtubers = Youtuber.where(user_id: user_ids).or(Youtuber.where(user_id: current_user.id)).page(params[:page]).per(10).includes(:user, :genre, :comments, :favorites).order("created_at DESC")
    elsif sort == "favorite"
      youtuber_ids = current_user.favorites.select(:youtuber_id)
      @youtubers =Youtuber.where(id: youtuber_ids).page(params[:page]).per(10).includes(:user, :genre, :comments, :favorites).order("created_at DESC")
    elsif sort == "genre-search"
      @genre = Genre.find(params[:genre_id])
      @youtubers = Youtuber.where(genre_id: @genre.id).page(params[:page]).per(10).includes(:user, :genre, :comments, :favorites).order("created_at DESC")
    else
      @youtubers = Youtuber.all.page(params[:page]).per(10).includes(:user, :genre, :comments, :favorites).order("created_at DESC")
    end
  end

  def show
    @youtuber = Youtuber.find(params[:id])
    @youtuber_comments = @youtuber.comments.page(params[:page]).includes(:user)
    @comment = Comment.new
    @user_profile = User.find(@youtuber.user.id)
    genre_ids = @user_profile.user_genres.select(:genre_id)
    @common_genres = current_user.genres.where(id: genre_ids)
  end

  def edit
    @youtuber = Youtuber.find(params[:id])
  end

  def update
    @youtuber = Youtuber.find(params[:id])
    if @youtuber.update(youtuber_params)
      redirect_to youtuber_path(@youtuber)
    else
      render :edit
    end
  end

  def destroy
    youtuber = Youtuber.find(params[:id])
    youtuber.destroy
    redirect_to user_path(current_user)
  end

  private

  def youtuber_params
    params.require(:youtuber).permit(:genre_id, :name, :evaluation, :content)
  end
end
