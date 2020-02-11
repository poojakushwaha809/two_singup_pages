class ApplicationController < ActionController::Base


	def after_sign_in_path_for(resource)
	  stored_location_for(resource) ||
	    if resource.is_a?(User) 
	      student_new_path
	    elsif resource.is_a?(Admin)
	      admin_new_path
	    end
	end

  	def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    unless user
        user = User.create(name: data['name'],
           email: data['email'],
           password: Devise.friendly_token[0,20]
        )
    end
    
 

end


  protect_from_forgery with: :exception

     before_action :configure_permitted_parameters, if: :devise_controller?




     protected

          def configure_permitted_parameters
               devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:student_name, :student_address, :contact_number, :batch_id, :email, :college_name, :password, :student_image)}

               devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:student_name, :student_address, :contact_number, :batch_id, :email, :college_name, :password, :current_password, :student_image)}
          end
end
