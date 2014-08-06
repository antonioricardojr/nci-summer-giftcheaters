class NotificationsMailer < ActionMailer::Base

  default :from => :email
  default :to => "giftcheaters.nci@gmail.com"

  def new_message(message)
    @message = message
    mail(:subject => "[Giftcheaters] #{message.subject}")
  end

end