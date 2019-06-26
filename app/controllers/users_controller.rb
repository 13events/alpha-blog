# frozen_string_literal: true

# Handle User actions
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  # create a new user and attempt sacing to db
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to Alpha Blog #{@user.username}"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  private

    #white list parameters
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
