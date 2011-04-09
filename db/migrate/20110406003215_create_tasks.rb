class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.string :name
      t.string :project
      t.string :sprint
      t.string :user_story
      t.text :description
      t.integer :effort

      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
