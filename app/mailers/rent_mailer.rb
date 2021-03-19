class RentMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.rent_mailer.send.subject
  #
  def create(from, to, first_name, email, title)
    @title = title
    @from = from
    @to = to
    @first_name = first_name
    mail to: email, subject: 'New rent'
  end
end
