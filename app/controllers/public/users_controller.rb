class Public::UsersController < ApplicationController
  def show
  end

  def edit
    @user = User.find(params[:id])
    @genres = Genre.where(application_status: true)
    @user_genre = @user.user_genres.build
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user)
  end

  private
  # ???
  def user_params
    params.require(:user).permit(:user_name, :image, :introduce, user_genres_attributes: [:genre_ids])
  end
end
