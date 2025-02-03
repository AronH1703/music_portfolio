class ContactController < ApplicationController  # <- Plural "ContactsController"
  def index
    @contact_form = ContactForm.new
  end

  def create
    @contact_form = ContactForm.new(contact_params)
    if @contact_form.valid?
      ContactMailer.contact_email(@contact_form).deliver_now
      flash[:notice] = "Your message has been sent!"
      redirect_to contact_path
    else
      flash[:alert] = "Please fill in all required fields."
      render :index
    end
  end

  private

  def contact_params
    params.require(:contact_form).permit(:name, :email, :message)
  end
end
