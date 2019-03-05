class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #

  # default from: 'hello@greenup.com'

  def welcome(user)
    @user = user  # Instance variable => available in view

    mail(to: @user.email, subject: 'Vous faites maintenant partie de la communauté Green Up !')
    # This will render a view in `app/views/user_mailer`!
  end
end
