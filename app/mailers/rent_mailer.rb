class RentMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.rent_mailer.send.subject
  #
  def create(book, rent)
    @rent = rent
    @book = book
    mail to: current_user.email, subject: 'New rent'
  end
end
