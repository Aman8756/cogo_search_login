
class Login
  require 'bcrypt'
  #include BCrypt
  def self.get_all(params)
    email = params[:email]
    password = params[:password_digest]

    if(!(params.has_key?(:email)))
      return {success:false, message: "input email"}
    end

    if (!(params.has_key?(:password_digest)))
      return {success:false, message: "input password"}
    end

    user = User.where(email: email).first

    if(user.present? && user.authenticate(password))   #redirect 2nd page
      return {success:true, message: "login successfully"}
    else
      return {success:false, message: "username or wrong password"}
    end

  end
end


