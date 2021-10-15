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
    @admin_contact =  AdminContact.new
  end

  def confirm
    @user_profile = User.find(params[:user_id])
    @contact = Contact.find_by(user_id: params[:user_id])
    @admin_contact = AdminContact.new(admin_contact_params)
    @admin_contact.contact_id = @contact.id
    if @admin_contact.invalid?
      render :show
    end
  end
  
  def back
    @contact = Contact.find_by(user_id: params[:user_id])
    @user_profile = User.find(@contact.user_id)
    @admin_contact = AdminContact.new(admin_contact_params)
    render :show
  end
  
  def create
    @contact = Contact.find_by(user_id: params[:user_id])
    @admin_contact = AdminContact.new(admin_contact_params)
    @admin_contact.contact_id = @contact.id
      if @admin_contact.save
        AdminContactMailer.admin_send_mail(@admin_contact, @contact).deliver_now
        redirect_to admin_contact_path(@contact)
      else
        render :show
      end
  end

  private
  
  def admin_contact_params
    params.require(:admin_contact).permit(:message)
  end
end
