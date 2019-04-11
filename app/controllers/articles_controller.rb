class ArticlesController < ApplicationController

	def index
		#grab all articles from database
		@articles = Article.all
	end
	def new
		@article = Article.new
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
			flash[:notice] = "Article Updated"
			redirect_to article_path(@article)
		else
			render 'edit'
		end

	end

	def create
		#render plain: params[:article].inspect
		@article = Article.new(article_params)
		
		#check and handle failed article save
		if @article.save
			flash[:notice] = "Article Created"
			redirect_to article_path(@article)
		else 
			render 'new'
		end
	end

	def show
		@article = Article.find(params[:id])
	end

	private 
	def article_params
		params.require(:article).permit(:title, :description)
	end
end
 