class Admin::YoutubersController < ApplicationController
  def index
    @youtubers = Youtuber.all.includes(:user, :genre, :comments, :favorites).order("created_at DESC")
    @genres = Genre.where(application_status: true)
    sort = params[:sort]
    if sort == "genre-search"
      @genre = Genre.find(params[:genre_id])
      @youtubers = Youtuber.where(genre_id: @genre.id).includes(:user, :genre, :comments, :favorites).order("created_at DESC")
    end
  end

  def show
    @youtuber = Youtuber.find(params[:id])
    @youtuber_comments = @youtuber.comments.includes(:user)
    @user_profile = User.find(@youtuber.user.id)
    @genres = Genre.where(application_status: true)
  end

  def destroy
    youtuber = Youtuber.find(params[:id])
    youtuber.destroy
    redirect_to admin_youtubers_path
  end
end
