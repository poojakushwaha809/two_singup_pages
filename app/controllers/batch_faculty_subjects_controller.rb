class BatchFacultySubjectsController < ApplicationController

	def new
		
	end

	def create
		@batch = Batch.find(params[:batch_id])
		@batch_faculty_subject = @batch.batch_faculty_subjects.create(batch_faculty_subject_params)
		redirect_to batch_path(@batch)
		
    end 

    def destroy
    	@batch = Batch.find(params[:batch_id])
    	@batch_faculty_subject = @batch.batch_faculty_subjects.find(params[:id])
    	@batch_faculty_subject.destroy
    	redirect_to batch_path(@batch)
    end

	private
	  def batch_faculty_subject_params
	    params.require(:batch_faculty_subject).permit(:batch_id, :faculty_id,:subject_id)
	  end


end
