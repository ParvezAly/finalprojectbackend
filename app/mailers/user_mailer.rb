class UserMailer < ApplicationMailer
  default from: 'travelnorth12344321@gmail.com'

  def welcome_email
    @email = params[:user_email]
    @password = params[:password]
    @url  = 'http://example.com/login'
    mail(to: @email, subject: 'Welcome to Travel North')
  end
end
