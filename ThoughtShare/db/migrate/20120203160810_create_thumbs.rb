class CreateThumbs < ActiveRecord::Migration
  def self.up
    create_table :thumbs do |t|
      t.integer :thinker_id
      t.integer :thought_id

      t.timestamps
    end
  end

  def self.down
    drop_table :thumbs
  end
end
