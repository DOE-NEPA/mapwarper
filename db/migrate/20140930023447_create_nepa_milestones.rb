class CreateNepaMilestones < ActiveRecord::Migration
  def self.up
    create_table :nepa_milestones do |t|
	t.belongs_to :nepa_document

      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :nepa_milestones
  end
end
