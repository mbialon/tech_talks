class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.timestamp :scheduled_at
      t.references :talk
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
