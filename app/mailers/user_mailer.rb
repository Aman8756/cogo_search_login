class UserMailer < ApplicationMailer
  def welcome_email(email)
    @email= email
    mail(to: email, subject: 'Cogoport Verification')
  end
end
