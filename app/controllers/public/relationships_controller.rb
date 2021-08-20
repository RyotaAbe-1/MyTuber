class Public::RelationshipsController < ApplicationController
  def follow
    current_user.follow(params[:id])
    page = params[:page]
    if page == "user-index"
      redirect_to users_path
    elsif page == "user-show"
      user = User.find(params[:id])
      redirect_to user_path(user)
    elsif page == "post-show"
      youtuber = Youtuber.find(params[:youtuber_id])
      redirect_to youtuber_path(youtuber)
    elsif page == "post-index"
      sort = params[:sort]
      if sort == "genre-search"
        genre = Genre.find(params[:genre_id])
        redirect_to youtubers_path(sort: sort, genre_id: genre.id)
      elsif sort == "genre-search-all"
        redirect_to youtubers_path(sort: sort)
      end
    end
  end

  def unfollow
    current_user.unfollow(params[:id])
    page = params[:page]
    if page == "user-index"
      redirect_to users_path
    elsif page == "user-show"
      user = User.find(params[:id])
      redirect_to user_path(user)
    elsif page == "post-show"
      youtuber = Youtuber.find(params[:youtuber_id])
      redirect_to youtuber_path(youtuber)
    elsif page == "post-index"
      sort = params[:sort]
      if sort == "genre-search"
        genre = Genre.find(params[:genre_id])
        redirect_to youtubers_path(sort: sort, genre_id: genre.id)
      elsif sort == "genre-search-all"
        redirect_to youtubers_path(sort: sort)
      else
        redirect_to youtubers_path(sort: sort)
      end
    end
  end

end
