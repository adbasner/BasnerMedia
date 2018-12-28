require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
  test 'get new category form and create category' do
    get new_api_category_path
    assert_template 'categories/new'
    assert_difference 'Category.count', 1 do
      post '/api/categories', :params => { category: { name: 'sports' } }
      follow_redirect!
    end
    assert_template 'categories/index'
    assert_match 'sports', response.body
  end

  test 'invalid category submission results in failure' do
    get new_api_category_path
    assert_template 'categories/new'
    assert_no_difference 'Category.count', 1 do
      post '/api/categories', :params => { category: { name: '' } }
      # follow_redirect!
    end
    # assert_template 'categories/new'
    assert_select 'div.alert'
    assert_select 'form.new_category'
    # assert_match 'sports', response.body
  end
end
