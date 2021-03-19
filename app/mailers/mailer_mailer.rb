class MailerMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mailer_mailer.send.subject
  #
  def create
    @book = Book.find(5)
    mail to: 'lucasenriquez1997@gmail.com', subject: 'Success! You did it.'
  end
end
