class ContactController < ApplicationController
  def new
    @contact_form = ContactForm.new
  end

  def create
    @contact_form = ContactForm.new(contact_form_params)
    if @contact_form.valid?
      NotificationsMailer.new_message(@contact_form).deliver
      redirect_to root_url, notice: "Message sent! Thank you for contacting us."
    else
      flash.now.alert = "Please fill all fields."
      render "new"
    end
  end

private

  def contact_form_params
    params.require(:contact_form).permit(:name, :email, :content)
  end
end
