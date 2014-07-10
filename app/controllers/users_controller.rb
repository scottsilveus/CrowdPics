class UsersController < ApplicationController
	before_action :authenticate_user!

	def show
	end

	def logout
		session.clear
	end

	def destroy
		User.find_by_email(current_user.email).destroy
		destroy_user_session_path(current_user)
		redirect_to '/'
	end

end