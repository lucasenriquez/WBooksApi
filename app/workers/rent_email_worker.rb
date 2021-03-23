class RentEmailWorker
  include Sidekiq::Worker

  def perform(email, first_name, title)
    RentMailer.newRent(email, first_name, title).deliver
  end
end
