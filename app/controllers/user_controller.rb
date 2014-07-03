class Users::RegistrationController < Devise::RegistrationsController

	def create
		session["#{resource_name}_return_to"] = user_show_path
		super
	end

end