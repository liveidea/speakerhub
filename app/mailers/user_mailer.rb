class UserMailer < ApplicationMailer
  # def sample_email(user)
  #   @user = user
  #   mail(to: @user.email, subject: 'Welcome to Speakerhub!')
  # end
  def request_send(user, conference, text)
    @user = user
    @conference = conference
    @text = text
    mail(to: "#{@user.email}", subject: "#{@user.account.f_name} #{@user.account.l_name} wants to join conference #{@conference.title}")
  end
end
