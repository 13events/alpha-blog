# frozen_string_literal: true

require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @category = Category.create(name: 'Sports')
  end

  test 'get categories index' do
    get categories_path
    assert_response :success
  end

  test 'get new' do
    get new_category_path
    assert_response :success
  end

  test 'show path' do
    get category_path(@category)
    assert_response :success
  end

  
end
