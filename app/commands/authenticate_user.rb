class AuthenticateUser
  prepend SimpleCommand
  
  def initialize(phone_no, password)
    @phone_no = phone_no
    @password = password
  end
  
  def call
    { detail:  'User' , id: user.id, token: JsonWebToken.encode(user_id: user.id) } if user
  end
  
  private
  
  attr_accessor :phone_no, :password
  
  def user
    user = User.find_by_phone_no(phone_no)
    return user if user && user.valid_password?(password)
    errors.add :user_authentication, 'Invalid Credentials'
    nil
  end
end