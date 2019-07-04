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

    user = User.create(email:email, password_digest:password, full_name:full_name)

    if(user.present?)
      return {success:"pass"}
    else
      return {success:"fail"}
    end
  end
end
