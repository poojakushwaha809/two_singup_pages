class StudentsController < ApplicationController
	def new
				@user = User.all

	end


	def index
		  @search = User.search(params[:q])
         @user = @search.result

	end
	def search
		index
		render :index
		
	end


	 # def index
		#   @user = User.ransack(params[:user_id])
		#   @student = @user.result(distinct: true)
  #    end


	def show
		@user = User.find(params[:user_id])
		
	end

	def edit
		@user = User.find(params[:id])

	end

	def update
	 @user = User.find(params[:id])

	 if @user.update(user_params)
      redirect_to students_path
    else
      render 'edit'
    end

	end



  
	def destroy
	 @user = User.find(params[:id])
		 @user.destroy
		redirect_to students_path
	end
end
