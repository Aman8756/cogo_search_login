class VerifyController < ApplicationController

  def index
    email= params[:email]
    user = User.where(email: email)

    if(user.present?)
      user.update(verify: true)
      # byebug
      redirect_to "http://localhost:3015/"
    end

  end

end