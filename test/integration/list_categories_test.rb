require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest
  def setup
    @category = Category.create(name: 'sports')
    @category2 = Category.create(name: 'programming')
  end

  test 'should show categories listing' do
    get api_categories_path
    assert_template 'categories/index'
    assert_select 'li', text: @category.name
    assert_select 'li', text: @category2.name
  end
end
