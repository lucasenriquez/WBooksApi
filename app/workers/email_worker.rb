class EmailWorker
  include Sidekiq::Worker

  def perform(email, first_name, title)
    RentMailer.create(email, first_name, title).deliver
  end
end
