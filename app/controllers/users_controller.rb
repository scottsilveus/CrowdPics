class UsersController < ApplicationController

	def show
	end

	def logout
	end

	def destroy
		User.find_by_email(current_user.email).destroy
		destroy_user_session_path(current_user)
		redirect_to '/'
	end

end