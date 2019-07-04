class Signing
  def self.get_all(params)
    email = params[:email]
    password = params[:password]
    full_name = params[:full_name]

    user = User.create(email:email, password:password, full_name:full_name)

    if(user.present?)
      return {success:"pass"}
    else
      return {success:"fail"}
    end
  end
end
