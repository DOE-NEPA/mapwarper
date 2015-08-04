class CreateNepaDocuments < ActiveRecord::Migration
  def self.up
    create_table :nepa_documents do |t|
	t.belongs_to :map

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

      t.timestamps
    end
  end

  def self.down
    drop_table :nepa_documents
  end
end
