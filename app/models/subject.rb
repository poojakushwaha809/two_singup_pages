class Subject < ApplicationRecord
	has_many :batch_faculty_subjects, dependent: :destroy
    
end
