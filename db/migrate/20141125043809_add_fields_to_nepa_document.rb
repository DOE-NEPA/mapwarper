class AddFieldsToNepaDocument < ActiveRecord::Migration
	def self.up
	
		#remove test columns and data from 20140928205209_create_nepa_documents.rb
		remove_column :nepa_documents, :doctype_cd
		remove_column :nepa_documents, :document_no
		remove_column :nepa_documents, :document_no_publishedas
		remove_column :nepa_documents, :document_no_adopted
		remove_column :nepa_documents, :nepa_phase_id
		remove_column :nepa_documents, :reviewtype_id
		remove_column :nepa_documents, :site_id
		remove_column :nepa_documents, :program_id
		remove_column :nepa_documents, :fieldoffice_id
		remove_column :nepa_documents, :title

		#add the required fields back in with conforming names and nepa specified widths
		change_table :nepa_documents do |t|
			t.integer :document_id_initial
			t.string :doctype_cd, :limit => 3
			t.string :document_no, :limit => 30
			t.string :document_no_published_as, :limit => 255
			t.string :document_no_adopted, :limit => 255
			t.integer :nepa_phase_id
			t.text :title
			t.integer :review_type_id
			t.integer :site_id
			t.integer :program_id
			t.integer :field_office_id
			t.boolean :is_doe_wide_contract
			t.boolean :is_adopted
			t.boolean :intended_to_be_adopted
			#t.decimal :total_nepa_cost, precision: 15, scale: 2
			#t.boolean :applicant_pays_cost
			#t.boolean :produced_in_house
			#t.decimal :months_complete, precision: 5, scale: 2
			t.text :comments
			t.datetime :entry_dt
			t.boolean :verified
			t.text :web_link
			t.boolean :is_in_doe_hq_archive_library
			t.boolean :is_in_doe_hq_archive_library_incomplete
			t.datetime :cover_date
			t.datetime :publish_dt
			t.boolean :mitigation_action_plan
			t.datetime :document_start_date
			t.datetime :document_end_date
			t.integer :contractor
			t.datetime :cancel_dt
		end
	end

	def self.down
		remove_column :nepa_documents, :document_id_initial
		remove_column :nepa_documents, :doctype_cd
		remove_column :nepa_documents, :document_no
		remove_column :nepa_documents, :document_no_published_as
		remove_column :nepa_documents, :document_no_adopted
		remove_column :nepa_documents, :nepa_phase_id
		remove_column :nepa_documents, :title
		remove_column :nepa_documents, :review_type_id
		remove_column :nepa_documents, :site_id
		remove_column :nepa_documents, :program_id
		remove_column :nepa_documents, :field_office_id
		remove_column :nepa_documents, :is_doe_wide_contract
		remove_column :nepa_documents, :is_adopted
		remove_column :nepa_documents, :intended_to_be_adopted
		#remove_column :nepa_documents, :total_nepa_cost
		#remove_column :nepa_documents, :applicant_pays_cost
		#remove_column :nepa_documents, :produced_in_house
		#remove_column :nepa_documents, :months_complete
		remove_column :nepa_documents, :comments
		remove_column :nepa_documents, :entry_dt
		remove_column :nepa_documents, :verified
		remove_column :nepa_documents, :web_link
		remove_column :nepa_documents, :is_in_doe_hq_archive_library
		remove_column :nepa_documents, :is_in_doe_hq_archive_library_incomplete
		remove_column :nepa_documents, :cover_date
		remove_column :nepa_documents, :publish_dt
		remove_column :nepa_documents, :mitigation_action_plan
		remove_column :nepa_documents, :document_start_date
		remove_column :nepa_documents, :document_end_date
		remove_column :nepa_documents, :contractor
		remove_column :nepa_documents, :cancel_dt

		#add fields from 20140928205209_create_nepa_documents.rb
		change_table :nepa_documents do |t|
			t.string :doctype_cd
			t.string :document_no
			t.string :document_no_publishedas
			t.string :document_no_adopted
			t.integer :nepa_phase_id
			t.integer :reviewtype_id
			t.integer :site_id
			t.integer :program_id
			t.integer :fieldoffice_id
			t.text :title
		end

	end
end

