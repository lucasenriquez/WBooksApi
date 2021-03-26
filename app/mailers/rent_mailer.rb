class RentMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.rent_mailer.send.subject
  #
  def new_rent(email, first_name, title, to, locale)
    I18n.locale = locale
    @to = to
    @title = title
    @first_name = first_name
    mail to: email, subject: t(:new_rent)
  end
end
