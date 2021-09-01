module Public::UsersHelper
  def current_user_followings
    (params[:sort] == "followings") && (@user == current_user)
  end

  def other_user_followings
    (params[:sort] == "followings") && (@user != current_user)
  end

  def current_user_followers
    (params[:sort] == "followers") && (@user == current_user)
  end

  def other_user_followers
    (params[:sort] == "followers") && (@user != current_user)
  end
end
