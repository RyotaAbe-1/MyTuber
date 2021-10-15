class AdminContactMailer < ApplicationMailer
  def admin_send_mail(admin_contact, contact)
    @admin_contact = admin_contact
    @contact = contact
    mail to: @contact.email, subject: 'Re: 【MyTuber お問い合わせについてのご連絡】'
  end
end
