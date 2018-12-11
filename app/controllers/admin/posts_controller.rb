class Admin::PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :delete, :destroy]

  def index
    @posts = Post.all
    render 'index.html.erb'
  end

  def show
    set_post
    render 'show.html.erb'
  end

  def new
    @post = Post.new
    render 'new.html.erb'
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = 1
    if @post.save
      flash[:success] = 'Post was successfully created'
      redirect_to admin_path(@post)
    else
      render 'new.html.erb'
    end
  end

  def edit
    set_post
    render 'edit.html.erb'
  end

  def update
    set_post

    if @post.update(post_params)
      flash[:success]= 'Post was successfully updated'
      redirect_to admin_path(@post)
    else
      render 'edit'
    end
  end

  def delete
    set_post
  end

  def destroy
    set_post
  end

  private

  # Drys up code
  def set_post
    @post = Post.find_by(id: params[:id])
  end

  # only allows certain params through
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
