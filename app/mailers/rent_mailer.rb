class RentMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.rent_mailer.send.subject
  #
  def create(email, first_name, title)
    @title = title
    @first_name = first_name
    mail to: email, subject: 'New rent'
  end
end
