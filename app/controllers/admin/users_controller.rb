class Admin::UsersController < ApplicationController
  before_action :admin?

  def show
    @user = User.find(params[:id])
    render 'show.html.erb'
  end

  def edit
    render 'edit.html.erb'
  end

  def update
  end
end
