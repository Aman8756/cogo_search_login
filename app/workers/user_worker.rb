class UserWorker
  include Sidekiq::Worker
  # sidekiq_options retry: false

  def perform(email,emailHash)
    # byebug
    # puts("worker done")
    UserMailer.welcome_email(email,emailHash).deliver_now
    sleep 10
    # byebug
    # puts("worker done")
  end

end