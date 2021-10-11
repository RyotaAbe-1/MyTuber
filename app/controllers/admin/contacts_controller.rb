class Admin::ContactsController < ApplicationController
  skip_before_action :authenticate_user!

  include CommonActions
  before_action :set_genres

  def index
    @contacts = Contact.all.page(params[:page]).includes(:user).order("created_at DESC")
  end
  
  def show
    @contact = Contact.find(params[:id])
    @user_profile = User.find(@contact.user_id)
  end
end
