# frozen_string_literal: true

class ArticlesController < ApplicationController
  # Call the 'set_article' method before performing the follwing actions
  before_action :set_article, only: %i[edit update show destroy]

  def index
    # grab all articles from database
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit; end

  def update
    if @article.update(article_params)
      flash[:success] = 'Article Successfully Updated'
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def create
    # render plain: params[:article].inspect
    @article = Article.new(article_params)

    # check and handle failed article save
    if @article.save
      flash[:success] = 'Article Successfully Created'
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def show; end

  def destroy
    # destroy the article
    @article.destroy

    # flash message
    flash[:danger] = 'Article Successfully deleted.'

    # redirect to articles index page
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
