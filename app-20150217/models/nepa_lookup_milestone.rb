class NepaLookupMilestone < ActiveRecord::Base
	#belongs_to :nepa_milestone

	has_many :nepa_milestone
end
