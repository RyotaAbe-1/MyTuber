class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if admin_signed_in?
      new_admin_genre_path
    elsif user_signed_in?
      root_path
    end
  end
end
