class Public::RelationshipsController < ApplicationController
  def follow
    current_user.follow(params[:id])
    page = params[:page]
    if page == "user-index"
      redirect_to request.referer
    elsif page == "user-show"
      @user = User.find(params[:id])
    elsif page == "post-index"
      @youtuber = Youtuber.find(params[:youtuber_id])
    end
  end

  def unfollow
    current_user.unfollow(params[:id])
    page = params[:page]
    if page == "user-index"
      redirect_to request.referer
    elsif page == "user-show"
      @user = User.find(params[:id])
    elsif page == "post-index"
      @youtuber = Youtuber.find(params[:youtuber_id])
    end
  end

end
