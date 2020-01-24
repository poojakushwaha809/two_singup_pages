Rails.application.routes.draw do
		# eg. http://localhost:3000/users/sign_in
		# eg. http://localhost:3000/admins/sign_in

		devise_for :users, path: 'users', controllers: { sessions: "users/sessions" }
		devise_for :admins, path: 'admins', controllers: { sessions: "admins/sessions" }
		root  "homes#dashboard"

		get 'homes/home', to: 'homes#new'
		get 'admins/admin', to: 'admins#new', as: :admin_new
		get 'students/new', to: 'students#new', as: :student_new
		get 'faculties/student', to: 'faculties#student_index', as: :student_index

		get 'batches/student', to: 'batches#student_batch_index', as: :student_batch_index




	 # root  "batches#index"


	  get 'contacts/contact', to: 'contacts#contact'
	  get 'about_us', to: 'about_us#about_us'



 

	resources :faculties
	resources :batches


    

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
