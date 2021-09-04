class Public::SearchesController < ApplicationController
  skip_before_action :authenticate_admin!
  include CommonActions
  before_action :set_genres
  before_action :set_current_user_profile

  def search
    category = params[:category]
    if category == "search-by-user"
      genre_ids = @user_profile.user_genres.select(:genre_id)
      @common_genres = current_user.genres.where(id: genre_ids)
      @users = User.search(params[:keyword]).page(params[:page]).includes(:genres).order("created_at DESC")
      render "public/users/index"
    elsif category == "search-by-post"
      @youtubers = Youtuber.search(params[:keyword]).page(params[:page]).per(10).includes(:user, :genre, :comments, :favorites).order("created_at DESC")
      render "public/youtubers/index"
    end
  end
end
