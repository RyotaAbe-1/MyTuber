class Admin::UsersController < ApplicationController
  def index
    @users = User.all
    @genres = Genre.where(application_status: true)
  end
  
  def update
    user = User.find(params[:id])
    user.update(user_params)
    page = params[:page]
    if page == "post-show"
      youtuber = Youtuber.find(params[:youtuber_id])
      redirect_to admin_youtuber_path(youtuber)
    elsif page == "user-show"
      redirect_to admin_user_path(user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:is_active)
  end

end
