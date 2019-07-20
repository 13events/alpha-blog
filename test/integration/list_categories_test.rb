# frozen_string_literal:true


class ListCategoriesTest < ActionDispatch::IntegrationTest

  def setup
    @category = Category.create(name: "Sports")
    @category2 = Category.create(name: "Travel")
    @category3 = Category.create(name: "Programming")
  end

  test 'should show categories listing' do
    get categories_path
    assert_template 'categories/index'
    assert_select "a[href=?]", category_path(@category), text: @category.name
    puts @category.name
    assert_select "a[href=?]", category_path(@category2), text: @category2.name
    puts @category2.name

    get categories_path(page:2)
    assert_select "a[href=?]", category_path(@category3), text: @category3.name
    puts @category3.name
  end

end