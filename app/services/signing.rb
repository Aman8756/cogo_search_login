require 'bcrypt'
class Signing
  include BCrypt
  def self.get_all(params)
    email = params[:email]
    password = params[:password_digest]
    full_name = params[:full_name]


    if(!(params.has_key?(:email)) || !(params.has_key?(:password_digest)) || !(params.has_key?(:full_name)))
      return {success:false}
    end

    @len = password.length
    if(@len < 6 || @len > 12)
      return {success:"fail", message:"Password length should be between 6 to 12"}
    end

    @regex = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

    if(!email.match(@regex))
      return {success:"fail", message:"Type a valid email"}
    end

    user = User.where(email: email)
    if(user.present?)
      return {success:"fail", message:"User Already present"}
    end

    user = User.create(email:email, password_digest:password, full_name:full_name)

    if(user.present?)
      return {success:"pass"}
    else
      return {success:"fail"}
    end
  end
end
