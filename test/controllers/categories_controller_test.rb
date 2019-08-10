# frozen_string_literal: true

require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @category = Category.create(name: 'Sports')
    @user = User.create(username: 'Jose', email: 'jose@example.com', password: 'password', admin: true)
  end

  test 'get categories index' do
    get categories_path
    assert_response :success
  end

  test 'get new' do
    sign_in_user(@user, 'password')
    get new_category_path
    assert_response :success
  end

  test 'show path' do
    get category_path(@category)
    assert_response :success
  end

  test 'should redirect create category when not logged in as admin' do
    assert_no_difference('Category.count') do
      post categories_path, params: {category:{name: 'Sports'}}
    end
    assert_redirected_to categories_path
  end

  
end
