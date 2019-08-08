# frozen_string_literal: true

class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def index
    @categories = Category.paginate(page: params[:page], per_page: 2)
  end

  def show; end

  def create
    @category = Category.new(category_params)
    @category.name.capitalize!
    if @category.save
      flash[:success] = "Category Created!"
      redirect_to categories_path
    else
      render 'new'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end