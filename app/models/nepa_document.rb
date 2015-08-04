### ------------------------------------------------------------------------------------------------------------------------ ###
### BWE addition
### 
### class NepaDocument
###
### ------------------------------------------------------------------------------------------------------------------------ ###
class NepaDocument < ActiveRecord::Base
	belongs_to :map 
	has_many :nepa_milestones

#id | map_id | doctype_cd | document_no | document_no_publishedas | document_no_adopted | nepa_phase_id | reviewtype_id | site_id | program_id | fieldoffice_id | title | created_at | updated_at 
#INSERT INTO nepa_documents (map_id, doctype_cd, document_no, document_no_publishedas, document_no_adopted, nepa_phase_id) VALUES (198, 'test doctype_cd', 'test document_no', 'test document_no_publishedas', 'test document_no_adopted', 4)
end
