class AddRemarksToTalkEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :remarks, :text
  end

  def self.down
    remove_column :events, :remarks
  end
end
