class Admin::SessionsController < ApplicationController
  def new
    render 'new.html.erb'
  end

  def create
    user = User.find_by(username: sessions_params[:username])
    if user && user.authenticate(sessions_params[:password])
      jwt = JWT.encode(
        {
          user: user.id,
          exp: 24.hours.from_now.to_i
        },
        Rails.application.credentials.fetch(:secret_key_base),
        'HS256'
      )
      puts '***************************'
      puts 'my jwt is:'
      puts jwt
      puts '***************************'
      session[:jwt] = jwt

      flash[:success] = "#{user.username} is logged in!"
      redirect_to "/admin/dashboard/#{user.id}"
    else
      flash.now[:warning] = 'Wrong user name or password'
      render 'new.html.erb'
    end
  end

  def destroy
    session[:jwt] = nil
    flash[:warning] = ['logged out']
    redirect_to admin_login_path
  end

  private

  def sessions_params
    params.require(:session).permit(:username, :password)
  end
end
