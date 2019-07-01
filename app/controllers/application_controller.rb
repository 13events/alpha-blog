# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :require_user

  protect_from_forgery with: :exception

  # Return the current user.
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # return bool describing if user is logged in.
  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:danger] = 'You must be logged in to perform this action.'
      redirect_to root_path
    end
  end
end
