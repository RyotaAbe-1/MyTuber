class Admin::SearchesController < ApplicationController
  def search
    category = params[:category]
    if category == "search-by-user"
      @users = User.search(params[:keyword]).includes(:genres).order("created_at DESC")
      @genres = Genre.where(application_status: true)
      render "admin/users/index"
    elsif category == "search-by-post"
      @youtubers = Youtuber.search(params[:keyword]).page(params[:page]).includes(:user, :genre, :comments, :favorites).includes(:user, :genre, :comments, :favorites).order("created_at DESC")
      @genres = Genre.where(application_status: true)
      render "admin/youtubers/index"
    end
  end
end
