class Admin::GenresController < ApplicationController
  def new
    @genres = Genre.where(application_status: true)
    @genre = Genre.new
  end
  def create
    genre = Genre.new(genre_params)
    genre.save
    redirect_to new_admin_genre_path
  end

  private
  def genre_params
    params.require(:genre).permit(:genre_name)
  end
end
