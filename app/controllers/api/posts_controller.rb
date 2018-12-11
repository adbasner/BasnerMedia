class Api::PostsController < ApplicationController
  def index
    @posts = Post.all
    render 'index.json.jbuilder'
  end

  def create
    post = Post.new(
      title: params[:title],
      content: params[:title]
    )

    if post.save
      render 'show.json.jbuilder'
    else
      render {}
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.title = params[:title] || @post.title
    @post.content = params[:content] || @post.content

    if photo.save
      render 'show.json.jbuilder'
    else
      render {}
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    render json: { message: 'The post was successfully deleted.' }
  end
end
