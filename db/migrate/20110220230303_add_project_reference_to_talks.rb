class AddProjectReferenceToTalks < ActiveRecord::Migration
  def self.up
    #add_column :talks, :project, :integer
    change_table :talks do |t|
      t.references :project
    end
  end

  def self.down
    #remove_column :talks, :project
    change_table :talks do |t|
      t.remove :project
    end
  end
end
