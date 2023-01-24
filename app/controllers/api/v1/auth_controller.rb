class Api::V1::AuthController < Api::BaseController
  skip_before_action :authenticate_user
  before_action :find_user, only: [:update]

  def create
    user = User.new(user_params)
    user.role = "user"
    if user.save
      json_success_response("User Created", user)
    else
      json_error_response('something went wrong', user.errors)
    end
  end

  def update
    if @user.update(user_params)
      json_success_response("User Updated", @user)
    else
      json_error_response('something went wrong', @user.errors)
    end
  end

  def authenticate
    command = AuthenticateUser.new(params[:phone_no], params[:password]).call

    if command.success?
      user = User.find(command.result[:id])
      user.update!(auth_token: command.result[:token])
      json_success_response('Login Successful', { user: user })
    else
      json_error_response('Your Email or Password is incorrect. Please try again.')
    end
  end

  private

  def find_user
    @user = User.find_by(id: params[:id])
  end

  def user_params
    params.permit(:phone_no, :email, :password, :full_name, :business_name)
  end

end
  