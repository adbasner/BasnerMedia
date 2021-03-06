class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  before_action :set_headers
  helper_method :admin_user, :admin?

  def set_headers
    if session[:jwt]
      @jwt = session[:jwt]
      response.headers['Authorization'] = "Bearer #{session[:jwt]}"
    else
      response.headers.delete('Authorization')
    end
  end

  def admin_user
    if response.headers['Authorization'].present?
      token = response.headers['Authorization'].split(' ').last
      begin
        decoded_token = JWT.decode(
          token,
          Rails.application.credentials.fetch(:secret_key_base),
          true,
          { algorithm: 'HS256' }
        )
        User.find_by(id: decoded_token[0]['user'])
      rescue JWT::ExpiredSignature
        nil
      end
    end
  end

  def admin?
    if admin_user
      true
    else
      flash[:danger] = 'You can not do that fool'
      redirect_to admin_login_path
    end
  end
end
