class RegistrationsController < Devise::RegistrationsController

	def after_sign_up_path_for(resource)
		@user = User.find_by_email(current_user.email)
		user_path(@user.id)
	end

	def after_sign_in_path_for(resource)
		@user = User.find_by_email(current_user.email)
		user_path(@user.id)
	end

	def destroy
		super
	end

end
