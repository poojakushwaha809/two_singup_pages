class Batch < ApplicationRecord

	belongs_to :faculty
    has_many :users, dependent: :destroy

	# def name
	# 	"laxmi"
	# end

	# def self.full_name
	# 	"laxmi vishwakarma"
	# end

end
