require 'test_helper'

class Api::CategoriesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @category = Category.create(name: 'sports')
  end

  test 'should get categories index' do
    get api_categories_path
    assert_response :success
  end

  test 'should get new' do
    get new_api_category_path
    assert_response :success
  end

  test 'should get show' do
    get api_category_path(@category)
    assert_response :success
  end
end
