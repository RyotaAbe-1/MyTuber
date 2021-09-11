class Public::FavoritesController < ApplicationController
  skip_before_action :authenticate_admin!

  def create
    @youtuber = Youtuber.find(params[:youtuber_id])
    favorite = Favorite.new(youtuber_id: @youtuber.id)
    favorite.user_id = current_user.id
    favorite.save
  end

  def destroy
    @youtuber = Youtuber.find(params[:youtuber_id])
    favorite = Favorite.where(user_id: current_user.id, youtuber_id: @youtuber.id)
    favorite.destroy_all
  end
end
