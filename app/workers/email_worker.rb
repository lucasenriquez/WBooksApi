class EmailWorker
  include Sidekiq::Worker

  def perform(user, rent, book)
    first_name, email = user
    title = book[:title]
    from, to = rent
    RentMailer.create(from, to, first_name, email, title).deliver
  end
end
