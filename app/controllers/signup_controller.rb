class SignupController < ApplicationController
  def main
    response = Signing.get_all(params)
    render json: response
  end
end
