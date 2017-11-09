class ContactMailer < ApplicationMailer
  def send_contact_email(email, contact_name, message)
    @email = email
    @contact_name = contact_name
    @message = message
    mail( to: email, subject: 'Your Receipt')
  end
end
