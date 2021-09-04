module CommonActions
  extend ActiveSupport::Concern

  def set_genres
    @genres = Genre.where(application_status: true)
  end
  
  def set_current_user_profile
    @user_profile = User.find(current_user.id)
  end
  
  def set_user_profile
    @user_profile = User.find(params[:id])
  end
  
end