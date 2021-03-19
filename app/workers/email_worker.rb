class EmailWorker
  include Sidekiq::Worker

  def perform(book, rent)
    RentMailer.create(book, rent).deliver
  end
end
