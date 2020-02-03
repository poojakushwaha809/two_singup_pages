class Faculty < ApplicationRecord
	has_many :batches, dependent: :destroy

end
