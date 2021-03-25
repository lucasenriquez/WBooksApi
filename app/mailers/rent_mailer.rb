class RentMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.rent_mailer.send.subject
  #
  def new_rent(email, first_name, title, from, to)
    @from = from
    @to = to
    @title = title
    @first_name = first_name
    mail to: email, subject: 'New rent'
  end
end
