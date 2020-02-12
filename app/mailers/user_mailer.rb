class UserMailer < ApplicationMailer
  default from: 'theonovaes@id.uff.br'

  def send_welcome_email(user)
    @user = user
    mail(:to => @user.email, :subject => "Welcome!")
  end

end