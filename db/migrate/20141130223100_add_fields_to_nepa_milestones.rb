class AddFieldsToNepaMilestones < ActiveRecord::Migration
	def self.up

		#remove test columns and data from 20140930023447_create_nepa_milestones.rb
		remove_column :nepa_milestones, :name
		remove_column :nepa_milestones, :description

		change_table :nepa_milestones do |t|
			t.integer :milestone_unique_id
			t.integer :document_id_initial # originally document_id
			t.integer :milestone_type # originally milestone_id
			t.datetime :actual_start_date
			t.datetime :actual_completion_date
			t.datetime :extension
			t.datetime :fr_date
			t.string :fr_number, :limit => 50
			t.integer :agency_id
			t.text :url
			t.boolean :accomplished
			t.boolean :projected
			t.boolean :next_milestone_status_chart
			t.boolean :estimated_start_date
			t.text :milestone_comments
			t.datetime :created_initial  # originally created
			t.text :web_link_secondary
			t.integer :sa_approved_id
			t.integer :epa_rating_id
		end
	end

	def self.down

		remove_column :nepa_milestones, :milestone_unique_id
		remove_column :nepa_milestones, :document_id_initial # originally document_id
		remove_column :nepa_milestones, :milestone_type # originally milestone_id
		remove_column :nepa_milestones, :actual_start_date
		remove_column :nepa_milestones, :actual_completion_date
		remove_column :nepa_milestones, :extension
		remove_column :nepa_milestones, :fr_date
		remove_column :nepa_milestones, :fr_number
		remove_column :nepa_milestones, :agency_id
		remove_column :nepa_milestones, :url
		remove_column :nepa_milestones, :accomplished
		remove_column :nepa_milestones, :projected
		remove_column :nepa_milestones, :next_milestone_status_chart
		remove_column :nepa_milestones, :estimated_start_date
		remove_column :nepa_milestones, :milestone_comments
		remove_column :nepa_milestones, :created_initial  # originally created
		remove_column :nepa_milestones, :web_link_secondary
		remove_column :nepa_milestones, :sa_approved_id
		remove_column :nepa_milestones, :epa_rating_id

		#add fields from 20140930023447_create_nepa_milestones.rb
		change_table :nepa_documents do |t|
			t.string :name
			t.string :description
		end
	end
end
