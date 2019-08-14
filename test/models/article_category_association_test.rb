require 'test_helper'

class ArticleCategoryAssociationTest < ActiveSupport::TestCase

  def setup
    @user = User.create(username: "Jose", email: 'Jose@example.com', password: "password", admin: true)
    @article = Article.create(title: "Testing title", description: "a test description", user_id: @user.id)
    @category = Category.create(name: 'Sports')

    @category.articles << @article
  end

  test 'test category assignment to article' do
    assert_not_equal 0, @article.categories.size
  end

  test 'article assignment to categories' do
    assert_not_equal 0, @category.articles.size
  end
end