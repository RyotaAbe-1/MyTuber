class Admin::YoutubersController < ApplicationController
  def index
    @youtubers = Youtuber.all.order("created_at DESC")
    @genres = Genre.where(application_status: true)
    sort = params[:sort]
    if sort == "genre-search"
      @genre = Genre.find(params[:genre_id])
    elsif sort == "search"
      @youtubers = Youtuber.search(params[:keyword]).order("created_at DESC")
    end
  end
end
