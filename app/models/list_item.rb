class ListItem < ActiveRecord::Base

	validates :title, presence: true, length: { maximum: 140 }
	validates :done, inclusion: { in: [true, false] }
end
