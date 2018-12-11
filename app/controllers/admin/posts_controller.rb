class Admin::PostsController < ApplicationController
  def index
    
    @posts = Post.all
    render 'index.html.erb'
  end

  def show
    @post = Post.find_by(id: params[:id])
    render 'show.html.erb'
  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def delete

  end

  def destroy

  end
end
