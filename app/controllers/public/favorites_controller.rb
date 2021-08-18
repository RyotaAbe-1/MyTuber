class Public::FavoritesController < ApplicationController
  def create
    youtuber = Youtuber.find(params[:youtuber_id])
    favorite = Favorite.new(youtuber_id: youtuber.id)
    favorite.user_id = current_user.id
    favorite.save
    redirect_to youtuber_path(youtuber)
  end

  def destroy
    youtuber = Youtuber.find(params[:youtuber_id])
    favorite = Favorite.where(user_id: current_user.id, youtuber_id: youtuber.id)
    favorite.destroy_all
    redirect_to youtuber_path(youtuber)
  end
end
