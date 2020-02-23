class BatchFacultySubject < ApplicationRecord
	belongs_to :batch
    belongs_to :subject
    belongs_to :faculty
end
