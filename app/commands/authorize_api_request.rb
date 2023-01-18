class AuthorizeApiRequest
  prepend SimpleCommand
  
  def initialize(headers = {})
    @headers = headers
  end
  
  def call
    user
  end
  
  private
  
  attr_reader :headers
  
  # def user
  #   token = http_auth_header
  #   user = User.where(auth_token: token).first
  #   if user.blank?
  #     errors.add(:token, 'Token Missing.')
  #   else
  #     errors.add(:token, 'Token Expired') if user.auth_token != http_auth_header
  #   end
  #   user.present? ? user : nil
  # end
  
  def user
    @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
    @user || errors.add(:token, "Invalid token") && nil
  end

  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end
  
  def http_auth_header
    if headers['Authorization'].present?
      return headers['Authorization'].split(' ').last
    else
      errors.add(:token, 'Missing Authorization Token')
    end
    nil
  end
end
