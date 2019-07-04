class Login
  def self.get_all(params)
    email = params[:email]
    password = params[:password]

    if(!(params.has_key?(:email)) || !(params.has_key?(:password)))
      return {success:false}
    end

    user = User.where(email: email, password: password)
    if(user.present?)   #redirect 2nd page
      return {success:true, message: "login successfully"}
    else
      return {success:false, message: "user is not present"}
    end

  end
end


