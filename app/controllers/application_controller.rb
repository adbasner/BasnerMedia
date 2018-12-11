class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  before_action :set_headers

  def set_headers
    if session[:jwt]
      @jwt = session[:jwt]
      response.headers['Authorization'] = "#{session[:jwt]}"
      puts "*************************"
      puts response.headers
      puts "*************************"
    else
      response.headers.delete('Authorization')
      puts "*************************"
      puts "deleted auth headers"
      puts response.headers
      puts "*************************"
    end
  end

  def admin_user
    if response.headers['Authorization'].present?
      puts "*************************"
      puts "In auth if statement"
      puts "*************************"
      token = response.headers['Authorization']
      begin
        decoded_token = JWT.decode(
          token,
          Rails.application.credentials.fetch(:secret_key_base),
          true,
          { algorithm: 'HS256' }
        )
        puts "*************************"
        puts decoded_token
        puts "*************************"
        User.find_by(id: decoded_token[0]["user"])
      rescue JWT::ExpiredSignature
        nil
      end
    end
  end

  helper_method :admin_user

  def admin?
    unless admin_user
      flash[:danger] = 'You can not do that fool'
      redirect_to admin_login_path
    end
  end
end
