class CreateNepaLookupMilestones < ActiveRecord::Migration
  def self.up
    create_table :nepa_lookup_milestones do |t|
      
	t.integer :milestone_id_initial
	t.boolean :ea_applic
	t.boolean :eis_applic
	t.boolean :sa_applic
	t.boolean :ea_create_for_new_doc
	t.boolean :eis_create_for_new_doc
	t.boolean :sa_create_for_new_doc
	t.string :milestone, :limit => 150
	t.boolean :fr_reference_needed
	t.boolean :has_date_range
	t.boolean :has_date_extension
	t.boolean :has_secondary_web_link
	t.decimal :milestone_order_eis, precision: 5, scale: 2
	t.decimal :milestone_order_ea, precision: 5, scale: 2
	t.boolean :internal
	t.boolean :is_active
	t.datetime :created_initial

      t.timestamps
    end
  end

  def self.down
    drop_table :nepa_lookup_milestones
  end
end
