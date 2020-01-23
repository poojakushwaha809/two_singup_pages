Rails.application.routes.draw do
		# eg. http://localhost:3000/users/sign_in
		# eg. http://localhost:3000/admins/sign_in

		devise_for :users, path: 'users', controllers: { sessions: "users/sessions" }
		devise_for :admins, path: 'admins', controllers: { sessions: "admins/sessions" }
		root  "homes#new"

		get 'homes/home', to: 'homes#new'
		get 'admins/admin', to: 'admins#new', as: :admin_new
		get 'students/new', to: 'students#new', as: :student_new







    

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
