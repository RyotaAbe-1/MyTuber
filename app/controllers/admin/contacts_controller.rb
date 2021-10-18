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
    @admin_contacts = AdminContact.where(contact_id: @contact.id).page(params[:page]).per(1).order("created_at DESC")
  end

  def confirm
    @contact = Contact.find(params[:contact_id])
    @admin_contact = AdminContact.new(admin_contact_params)
    @admin_contact.contact_id = @contact.id
    if @admin_contact.invalid?
      @user_profile = User.find(@contact.user_id)
      @admin_contacts = AdminContact.where(contact_id: @contact.id).page(params[:page]).per(1).order("created_at DESC")
      render :show
    end
  end
  
  def back
    @contact = Contact.find(params[:contact_id])
    @user_profile = User.find(@contact.user_id)
    @admin_contact = AdminContact.new(admin_contact_params)
    @admin_contacts = AdminContact.where(contact_id: @contact.id).page(params[:page]).per(1).order("created_at DESC")
    render :show
  end
  
  def create
    @contact = Contact.find(params[:contact_id])
    @admin_contact = AdminContact.new(admin_contact_params)
    @admin_contact.contact_id = @contact.id
      if @admin_contact.save
        AdminContactMailer.admin_send_mail(@admin_contact, @contact).deliver_now
        redirect_to admin_contact_path(@contact)
      else
        @user_profile = User.find(@contact.user_id)
        @admin_contacts = AdminContact.where(contact_id: @contact.id).page(params[:page]).per(1).order("created_at DESC")
        render :show
      end
  end

  private
  
  def admin_contact_params
    params.require(:admin_contact).permit(:message)
  end
end
