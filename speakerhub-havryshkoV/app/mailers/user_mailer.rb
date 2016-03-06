class UserMailer < ApplicationMailer
  # def sample_email(user)
  #   @user = user
  #   mail(to: @user.email, subject: 'Welcome to Speakerhub!')
  # end
  def request_send(email, f_name, l_name, conf_title, text)
    @text = text
    mail(to: email, subject: "#{f_name} #{l_name} wants to join #{conf_title}")
  end
end
