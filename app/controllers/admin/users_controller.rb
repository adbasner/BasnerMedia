class Admin::UsersController < ApplicationController
  before_action :admin?
  before_action :set_user
  before_action :require_same_user, only: [:edit, :update]

  def show
    @last = Post.last.id
    render 'show.html.erb'
  end

  def edit
    render 'edit.html.erb'
  end

  def update
    if @user.update(user_params)
      flash[:success] = 'Account details updated'
      redirect_to admin_dashboard_path
    else
      render 'edit.html.erb'
    end
  end

  private

  def set_user
    @user = User.find_by(id: admin_user.id)
  end

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

  def require_same_user
    if admin_user != @user
      flash[:danger] = 'Yticle me helm!'
      redirect_to admin_dashboard_path
    end
  end
end
