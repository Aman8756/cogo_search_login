class LoginController < ApplicationController
  def index
    response = Login.get_all(params)
    render :json => response
  end
end
