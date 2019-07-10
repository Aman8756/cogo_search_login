class SignupController < ApplicationController
  def main
    response = Signing.get_all(params)
    if(response[:success])
      email= params[:email]
      emailHash= email.to_i(36)
      $redis.set(emailHash,email)
      
      UserWorker.perform_async(email,emailHash)
    end
    render json: response
  end

  # def register
  #   UserWorker.perform_async(params[:email])
  #   redirect_to :root
  # end

end
