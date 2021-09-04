class Public::GenresController < ApplicationController
  include CommonActions
  before_action :set_genres
  before_action :set_current_user_profile
  
  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to new_genre_path
    else
      render :new
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:genre_name)
  end
end
