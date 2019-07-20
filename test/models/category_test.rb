# frozen_string_literal: true

require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = Category.new(name: 'Sports')
  end

  test 'category should be valid' do
    assert @category.valid?
  end

  test 'name should be present' do
    @category.name = ''
    assert_not @category.valid?
  end

  test 'name is unique' do
    @category.save
    category2 = Category.new(name: 'sports')
    assert_not category2.valid?
  end

  test 'name too long' do
    @category.name = 'a' * 26
    assert_not @category.valid?
  end

  test 'name too short' do
    @category.name = 'a'
    assert_not @category.valid?
  end
end
