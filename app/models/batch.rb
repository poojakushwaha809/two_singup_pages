class Batch < ApplicationRecord

    has_many :users, dependent: :destroy
    has_many :batch_faculty_subjects, dependent: :destroy
   
	# def name
	# 	"laxmi"
	# end

	# def self.full_name
	# 	"laxmi vishwakarma"
	# end

end
