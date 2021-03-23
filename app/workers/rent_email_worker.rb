class RentEmailWorker
  include Sidekiq::Worker

  def perform(email, first_name, title)
    RentMailer.new_rent(email, first_name, title).deliver
  end
end
