class Admin::ContactsController < ApplicationController
  skip_before_action :authenticate_user!

  include CommonActions
  before_action :set_genres

  def index
    @contacts = Contact.all.includes(:user).order("created_at DESC")
  end
end
