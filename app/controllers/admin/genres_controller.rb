class Admin::GenresController < ApplicationController
  def new
    @genres = Genre.where(application_status: false)
    @genre = Genre.new
    @genre_all = Genre.all
  end

  def create
    genre = Genre.new(genre_params)
    genre.application_status = true
    genre.save
    redirect_to new_admin_genre_path
  end

  def update
    genre = Genre.find(params[:id])
    genre.update(genre_params)
    redirect_to new_admin_genre_path
  end

  def destroy
    genre = Genre.find(params[:id])
    genre.destroy
    redirect_to new_admin_genre_path
  end

  private
  def genre_params
    params.require(:genre).permit(:genre_name, :application_status)
  end
end
