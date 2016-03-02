class MailerJob < ActiveJob::Base
  queue_as :default

  def perform(conference,request)
    UserMailer.request_send(conference, request).deliver_now
  end
end
