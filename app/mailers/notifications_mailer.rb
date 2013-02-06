class NotificationsMailer < ActionMailer::Base
  default from: "info@crossway.ca"
  default to: "derek@crossway.ca"

  def new_message(message)
    @message = message
    
    mail(:subject => "[crossway.ca] New Message from Contact Form")
  end
end
