class LogoutController < ApplicationController
  def index
    $redis.del(params[:cookieHash])
    check = $redis.get(params[:cookieHash])
    puts(check)
    if (check!=nil)
      render json:{success:true,message:"Record found"}
    else
      render json:{success:true,message:"No Record"}
    end
  end
end