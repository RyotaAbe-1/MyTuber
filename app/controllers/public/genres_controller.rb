class Public::GenresController < ApplicationController
  def new
    @genre = Genre.new
    @user_profile = User.find(current_user.id)
    @genres = Genre.where(application_status: true)
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to new_genre_path
    else
      @user_profile = User.find(current_user.id)
      @genres = Genre.where(application_status: true)
      render :new
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:genre_name)
  end
end
