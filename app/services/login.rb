
class Login
  require 'bcrypt'
  #include BCrypt
  def self.get_all(params)
    email = params[:email]
    password = params[:password]

    user = User.where(email: email).first


    if(user.present? && !(user.verify))
      return {success:false, message:"email not verified"}
    end

    if(!(params.has_key?(:email)))
      return {success:false, message: "input email"}
    end

    if (!(params.has_key?(:password)))
      return {success:false, message: "input password"}
    end


    if(user.present? && user.authenticate(password))   #redirect 2nd page
      return {success:true, message: "login successfully"}
    else
      return {success:false, message: "username or wrong password"}
    end

  end
end


