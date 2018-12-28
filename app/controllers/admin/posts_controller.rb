class Admin::PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :delete, :destroy]
  before_action :require_same_user, only: [:edit, :update, :delete, :destroy]

  def index
    @posts = Post.all.order(created_at: :desc)
    render 'index.html.erb'
  end

  def show
    render 'show.html.erb'
  end

  def new
    @post = Post.new
    render 'new.html.erb'
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = admin_user.id
    if @post.save
      flash[:success] = 'Post was successfully created'
      redirect_to admin_path(@post)
    else
      render 'new.html.erb'
    end
  end

  def edit
    render 'edit.html.erb'
  end

  def update
    if @post.update(post_params)
      flash[:success] = 'Post was successfully updated'
      redirect_to admin_path(@post)
    else
      render 'edit.html.erb'
    end
  end

  def delete
    render 'delete.html.erb'
  end

  def destroy
    if @post.destroy
      flash[:warning] = 'Article was deleted'
      redirect_to admin_posts_path
    else
      flash[:danger] = 'Article was not deleted'
      redirect_to admin_path(@post)
    end
  end

  private

  # Drys up code
  def set_post
    @post = Post.find_by(id: params[:id])
  end

  # only allows certain params through
  def post_params
    params.require(:post).permit(:title, :content, category_ids: [])
  end
 
  # Makes sure current_user is same as post created
  # Shouldn't be needed with only 1 user, but whatever
  def require_same_user
    if admin_user != @post.user
      flash[:danger] = ['You can not edit these articles fool']
      redirect_to admin_posts_path
    end
  end
end
