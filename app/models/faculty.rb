class Faculty < ApplicationRecord
	has_many :batch_faculty_subjects, dependent: :destroy
    

end
