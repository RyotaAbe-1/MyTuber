class Admin::SearchesController < ApplicationController
  def search
    category = params[:category]
    if category == "search-by-user"
      @users = User.search(params[:keyword]).order("created_at DESC")
      @genres = Genre.where(application_status: true)
      render "admin/users/index"
    elsif category == "search-by-post"
      @youtubers = Youtuber.search(params[:keyword]).order("created_at DESC")
      @genres = Genre.where(application_status: true)
      render "admin/youtubers/index"
    end
  end
end
