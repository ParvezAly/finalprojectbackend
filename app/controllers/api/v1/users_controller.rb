class Api::V1::UsersController < Api::V1::BaseController
  skip_before_action :require_login, only: [:login]
  #Login function
  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      payload = {user_id: user.id}
      token = encode_token(payload)
      render json: { email: user.email, name: user.name, auth_token: token, success: true }
    else
      render json: { :message => "Log in failed! Username or password invalid!", :success => false }
    end
  end

end
