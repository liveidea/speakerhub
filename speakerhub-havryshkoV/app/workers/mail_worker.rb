class MailWorker
  include Sidekiq::Worker
  def perform(h, count)
    h = JSON.load(h)
    UserMailer.request_send(h['email'], h['f_name'], h['l_name'], h['conf_title'], h['message']).deliver_now
  end
end
