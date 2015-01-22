class MessageMailer < ActionMailer::Base

  default from: "noreply@youdomain.dev"
  default to: "Jody Johnson <Jody.EP.Johnson@gmail.com>"

  def new_message(message)
    @message = message

    mail subject: "Email from #{message.name} on JodyJohnsonIsMe.herokuapp.com"
  end
end
