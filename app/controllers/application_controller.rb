class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  alias_method :devise_after_sign_in_path_for, :after_sign_in_path_for

  def after_sign_in_path_for(user)
  	user_path(user)
  end


end
