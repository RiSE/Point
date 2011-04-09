class CreateStories < ActiveRecord::Migration
  def self.up
    create_table :stories do |t|
      t.string :project
      t.string :name
      t.string :as
      t.text :description
      t.text :so_that

      t.timestamps
    end
  end

  def self.down
    drop_table :stories
  end
end
