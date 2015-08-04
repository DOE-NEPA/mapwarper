### ------------------------------------------------------------------------------------------------------------------------ ###
### BWE addition
### 
### class NepaMilestone
###
### ------------------------------------------------------------------------------------------------------------------------ ###
class NepaMilestone < ActiveRecord::Base
	belongs_to :nepa_document 
	
	#has_one :nepa_lookup_milestone
	#accepts_nested_attributes_for :nepa_lookup_milestone

	belongs_to :nepa_lookup_milestone
end
