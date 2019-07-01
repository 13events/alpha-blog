# frozen_string_literal: true

# Handle actions related to user login/logout
class SessionsController < ApplicationController
  def new; end

  # Find user in db by email, check if we can authenticate only if we found a match
  # Display user page on success, flash message on fail.
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome #{user.username}"
      redirect_to user_path(user)
    else
      flash.now[:danger] = 'Email and Password not found!'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:danger] = 'You have logged out!'
    redirect_to root_path
  end
end
