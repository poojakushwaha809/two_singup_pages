class SubjectsController < ApplicationController
	def index
		@subjects = Subject.all
	end

	
	

	def new
      @subject = Subject.new	
	end

	def create
	  @subject = Subject.new(subject_params)
	 
	 if @subject.save
	  redirect_to @subject
	else
		render 'new'
	end
    end 

	def show
		@subject = Subject.find(params[:id])
		
	end

	def edit
		@subject = Subject.find(params[:id])

	end

	def update
	 @subject = Subject.find(params[:id])

	 if @subject.update(subject_params)
      redirect_to @subject
    else
      render 'edit'
    end

	end


	def destroy
	 @subject = Subject.find(params[:id])
		 @subject.destroy
		redirect_to @subject
	end
	 
	private
	  def subject_params
	    params.require(:subject).permit(:subject_name)
	  end
end
