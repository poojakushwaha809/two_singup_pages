class ApplicationController < ActionController::Base

skip_before_action :verify_authenticity_token
# protect_from_forgery with: :null_session
before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource)
	  stored_location_for(resource) ||
	    if resource.is_a?(User) 
	      student_new_path
	    elsif resource.is_a?(Admin)
	      admin_new_path
	    end
	end

  	
 



  # protect_from_forgery with: :exception





     protected

          def configure_permitted_parameters
          	# byebug
               devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:student_name, :student_address, :contact_number, :batch_id, :email, :college_name, :password, :student_image, :name, :provider, :uid, :image)}

               devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:student_name, :student_address, :contact_number, :batch_id, :email, :college_name, :password, :current_password, :student_image)}
          end
end
