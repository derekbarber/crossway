class ContactController < ApplicationController
  def new
    @contact_form = ContactForm.new
  end

  def create
    begin
      @contact_form = ContactForm.new(params[:contact_form])
      @contact_form.request = request
      if @contact_form.deliver
        redirect_to root_url, notice: "Message sent! Thank you for contacting us."
      else 
        render :new 
      end
    rescue
      ScriptError flash[:error] = 'Sorry, this message appears to be spam and was not delivered.' 
    end
  end
end
