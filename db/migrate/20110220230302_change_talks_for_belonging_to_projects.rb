class ChangeTalksForBelongingToProjects < ActiveRecord::Migration
  def self.up
    change_table :talks do |t|
      #przepnij id
      t.rename :user, :project
    end
  end

  def self.down
    change_table :talks do |t|
      #przepnij id w druga strone
      t.rename :project, :user
    end
  end
end
