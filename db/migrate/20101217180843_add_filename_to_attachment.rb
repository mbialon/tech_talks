class AddFilenameToAttachment < ActiveRecord::Migration
  def self.up
    add_column :attachments, :filename, :string
  end

  def self.down
    remove_column :attachments, :filename
  end
end
