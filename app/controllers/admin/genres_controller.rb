class Admin::GenresController < ApplicationController
  include CommonActions
  before_action :set_genres, only: [:new, :create]
  
  
  def new
    @genre = Genre.new
    @genre_all = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.application_status = true
    if @genre.save
      redirect_to new_admin_genre_path
    elsif
      @genre_all = Genre.all
      render :new
    end
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
