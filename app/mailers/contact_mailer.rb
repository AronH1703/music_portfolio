class ContactMailer < ApplicationMailer
  default to: 'your-email@example.com'

  def contact_email(contact_form)
    @contact_form = contact_form
    mail(from: @contact_form.email, subject: "New Contact Form Submission")
  end
end
