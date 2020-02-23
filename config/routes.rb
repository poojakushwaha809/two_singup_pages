Rails.application.routes.draw do
		# eg. http://localhost:3000/users/sign_in
		# eg. http://localhost:3000/admins/sign_in
# devise_for :users, controllers: { sessions: "users/sessions"} 
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}

devise_for :admins, path: 'admins', controllers: { sessions: "admins/sessions"}
		root  "homes#dashboard"

		get 'homes/home', to: 'homes#new'
		get 'admins/admin', to: 'admins#new', as: :admin_new
		get 'students/new', to: 'students#new', as: :student_new
		get 'faculties/student', to: 'faculties#student_index', as: :student_index

		get 'batches/student', to: 'batches#student_batch_index', as: :student_batch_index


  # get '/auth/:provider/callback', to: 'sessions#create'


	 # root  "batches#index"


	  get 'homes/contact', to: 'homes#contact'
	  get 'about_us', to: 'homes#about_us'

	  get 'new/index', to: 'students#new_index'

    get 'students/:user_id', to: 'students#show', as: :students_show



	  	  resources :students do
	  	  	collection do
	  	  		match "search" => 'students#index', via: [:get, :post], as: :search


	  	    end
 		
	  	  end
	  	  		


    # get '/assets/bootstrap-custom'
 
    resources :subjects
	resources :faculties
	resources :batches do
		resources :batch_faculty_subjects
	end

    

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
