class RentEmailWorker
  include Sidekiq::Worker

  def perform(email, first_name, title, from, to)
    RentMailer.new_rent(email, first_name, title, from, to).deliver
  end
end
