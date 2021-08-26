class Admin::YoutubersController < ApplicationController
  def index
    @youtubers = Youtuber.all.order("created_at DESC").includes(:user, :genre, :comments, :favorites)
    @genres = Genre.where(application_status: true)
    sort = params[:sort]
    if sort == "genre-search"
      @genre = Genre.find(params[:genre_id])
    elsif sort == "search"
      @youtubers = Youtuber.search(params[:keyword]).order("created_at DESC")
    end
  end

  def show
    @youtuber = Youtuber.find(params[:id])
    @user_profile = User.find(@youtuber.user.id)
    @genres = Genre.where(application_status: true)
  end

  def destroy
    youtuber = Youtuber.find(params[:id])
    youtuber.destroy
    redirect_to admin_youtubers_path
  end
end
