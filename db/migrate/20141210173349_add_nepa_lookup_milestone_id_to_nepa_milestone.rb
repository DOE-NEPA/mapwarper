class AddNepaLookupMilestoneIdToNepaMilestone < ActiveRecord::Migration
  def self.up
    add_column :nepa_milestones, :nepa_lookup_milestone_id, :integer
  end

  def self.down
    remove_column :nepa_milestones, :nepa_lookup_milestone_id
  end
end
