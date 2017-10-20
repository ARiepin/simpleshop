class UserMailer < ApplicationMailer
  default from: 'no-reply@simpleshop.com'
  layout 'mailer'
  default template_path: 'devise/mailer'

  def notify_about_account_creation(user)
    mail(to: user.email, subject: "Welcome to Simple Shop, #{user.email} ")
  end
end
