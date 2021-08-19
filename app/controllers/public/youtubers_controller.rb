class Public::YoutubersController < ApplicationController
  def new
    @youtuber = Youtuber.new
    @user_profile = User.find(current_user.id)
    @genres = Genre.where(application_status: true)
  end

  def create
    youtuber = Youtuber.new(youtuber_params)
    youtuber.user_id = current_user.id
    youtuber.save
    redirect_to youtuber_path(youtuber)
  end

  def index
    @youtubers = Youtuber.all.order("created_at DESC")
    @user_profile = User.find(current_user.id)
    @genres = Genre.where(application_status: true)
    sort = params[:sort]
    if sort == "timeline"
      @users = current_user.followers
    elsif sort == "genre-search"

    elsif sort == "favorite"
      @favorites = Favorite.where(user_id: current_user.id)
    end


  end

  def show
    @youtuber = Youtuber.find(params[:id])
    @comment = Comment.new
    @user_profile = User.find(@youtuber.user.id)
    @genres = Genre.where(application_status: true)
  end

  def edit
    @youtuber = Youtuber.find(params[:id])
    @user_profile = User.find(current_user.id)
    @genres = Genre.where(application_status: true)
  end

  def update
    youtuber = Youtuber.find(params[:id])
    youtuber.update(youtuber_params)
    redirect_to youtuber_path(youtuber)
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
