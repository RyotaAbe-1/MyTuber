class Public::RelationshipsController < ApplicationController
  skip_before_action :authenticate_admin!

  def follow
    current_user.follow(params[:id])
    page = params[:page]
    if page == "post-index"
      @youtuber = Youtuber.find(params[:youtuber_id])
    else
      @user = User.find(params[:id])
    end
  end

  def unfollow
    current_user.unfollow(params[:id])
    page = params[:page]
    if page == "post-index"
      @youtuber = Youtuber.find(params[:youtuber_id])
    else
      @user = User.find(params[:id])
    end
  end
end
