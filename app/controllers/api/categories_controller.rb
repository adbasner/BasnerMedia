class Api::CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = 'Category was created'
      redirect_to api_categories_path
    else
      render 'new.html.erb'
    end
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
