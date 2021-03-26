class RentEmailWorker
  include Sidekiq::Worker

  def perform(email, first_name, title, to, locale)
    RentMailer.new_rent(email, first_name, title, to, locale).deliver
  end
end
