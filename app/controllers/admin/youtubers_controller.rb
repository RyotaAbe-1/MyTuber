class Admin::YoutubersController < ApplicationController
  skip_before_action :authenticate_user!
  include CommonActions
  before_action :set_genres, except: [:destroy]
  
  def index
    sort = params[:sort]
    if sort == "genre-search"
      @genre = Genre.find(params[:genre_id])
      @youtubers = Youtuber.where(genre_id: @genre.id).page(params[:page]).per(10).includes(:user, :genre, :comments, :favorites).order("created_at DESC")
    else
      @youtubers = Youtuber.page(params[:page]).per(10).includes(:user, :genre, :comments, :favorites).order("created_at DESC")
    end
  end

  def show
    @youtuber = Youtuber.find(params[:id])
    @youtuber_comments = @youtuber.comments.page(params[:page]).includes(:user)
    @user_profile = User.find(@youtuber.user.id)
  end

  def destroy
    youtuber = Youtuber.find(params[:id])
    youtuber.destroy
    redirect_to admin_youtubers_path
  end
end
