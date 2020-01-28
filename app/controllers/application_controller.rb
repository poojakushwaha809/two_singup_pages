class ApplicationController < ActionController::Base

	# before_action :authenticate_user!

	# before_action :authenticate_admin!

	def after_sign_in_path_for(resource)
	  stored_location_for(resource) ||
	    if resource.is_a?(User) 
	      student_new_path
	    elsif resource.is_a?(Admin)
	      admin_new_path
	    end
	end

end
