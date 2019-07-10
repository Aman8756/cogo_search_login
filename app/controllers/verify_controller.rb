class VerifyController < ApplicationController

  def index
    email= $redis.get(params[:email_hash])
    # email_hash= email.to_i(36)
    # puts(email_hash)
    user = User.where(email: email)

    if(email!=nil && user.present?)
      user.update(verify: true)
      # byebug
      redirect_to "http://localhost:3015/"
    end

  end

end