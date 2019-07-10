class UserMailer < ApplicationMailer
  def welcome_email(email,emailHash)
    @email= email
    @emailHash= emailHash
    mail(to: email, subject: 'Cogoport Verification')
  end
end
