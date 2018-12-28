require 'test_helper'

class Api::CategoriesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @category = Category.create(name: 'sports')
    @user = User.create(username: 'fake', password: 'password', password_confirmation: 'password', admin: true)
  end

  test 'should get categories index' do
    get api_categories_path
    assert_response :success
  end

  test 'should get new' do
    sign_in_as(@user, 'password')
    get new_api_category_path
    assert_response :success
  end

  test 'should get show' do
    get api_category_path(@category)
    assert_response :success
  end

  test 'should redirect create when admin not logged in' do
    assert_no_difference 'Category.count' do
      post '/api/categories', params: { category: { name: 'sports' } }
    end
    assert_redirected_to api_categories_path
  end
end
