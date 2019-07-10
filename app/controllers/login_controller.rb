class LoginController < ApplicationController
  def index
    # $redis.set("a", 1)
    # trial=$redis.get("a")
    # puts(trial)

    response = Login.get_all(params)
    render :json => response
  end
end
