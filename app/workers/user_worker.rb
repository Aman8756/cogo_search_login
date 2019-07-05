class UserWorker
  include Sidekiq::Worker
  # sidekiq_options retry: false

  def perform(email)
    # byebug
    # puts("worker done")
    UserMailer.welcome_email(email).deliver_now
    sleep 10
    # byebug
    # puts("worker done")
  end

end