class CreateAttendances < ActiveRecord::Migration
  def self.up
    create_table :attendances do |t|
      t.references :user
      t.references :talk

      t.timestamps
    end
  end

  def self.down
    drop_table :attendances
  end
end
