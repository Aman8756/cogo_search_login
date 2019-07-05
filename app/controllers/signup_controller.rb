class SignupController < ApplicationController
  def main
    response = Signing.get_all(params)
    byebug
    UserWorker.perform_async(params[:email])
    render json: response
  end

  # def register
  #   UserWorker.perform_async(params[:email])
  #   redirect_to :root
  # end

end
