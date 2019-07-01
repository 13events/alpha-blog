# frozen_string_literal: true

# Handle User actions
class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update show]
  before_action :require_same_user, only: %i[edit update]

  def new
    @user = User.new
  end

  # create a new user and attempt sacing to db
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to Alpha Blog #{@user.username}"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  # gets correct user using id parameter
  def edit
    require_user
  end

  # Used by edit action
  def update
    if @user.update(user_params)
      flash[:success] = 'Account Updated'
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def show
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 2)
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 2)
  end

  private

  # white list parameters
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user
      flash[:danger] = "You can only edit your own account."
      redirect_to root_path
    end
  end
end
