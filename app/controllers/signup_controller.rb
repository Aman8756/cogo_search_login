class SignupController < ApplicationController
  def main
    response = Signing.get_all(params)
    if(response[:success])
      UserWorker.perform_async(params[:email])
    end
    render json: response
  end

  # def register
  #   UserWorker.perform_async(params[:email])
  #   redirect_to :root
  # end

end
