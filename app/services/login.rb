
class Login
  require 'bcrypt'
  #include BCrypt
  def self.get_all(params)
    email = params[:email]
    password = params[:password]

    user = User.where(email: email).first

    email_concat= email+password
    email_concat_hash= email_concat.to_i(36)

    if(user.present? && !(user.verify))
      return {success:false, message:"email not verified",cookieHash:0}
    end

    if(!(params.has_key?(:email)))
      return {success:false, message: "input email",cookieHash:0}
    end

    if (!(params.has_key?(:password)))
      return {success:false, message: "input password",cookieHash:0}
    end


    if(user.present? && user.authenticate(password))   #redirect 2nd page
      $redis.set(email_concat_hash,email)
      return {success:true, message: "login successfully",cookieHash:email_concat_hash}
    else
      return {success:false, message: "username or wrong password",cookieHash:0}
    end

  end
end


