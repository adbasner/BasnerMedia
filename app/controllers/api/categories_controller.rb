class Api::CategoriesController < ApplicationController
  before_action :require_admin, except: [:index, :show]

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

  def require_admin
    if !admin_user
      flash[:danger] = 'Only admins can do that'
      redirect_to api_categories_path
    end
  end
end
