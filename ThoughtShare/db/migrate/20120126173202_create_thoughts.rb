class CreateThoughts < ActiveRecord::Migration
  def change
    create_table :thoughts do |t|
      t.integer :thinker_id
      t.text :thought
      t.timestamps
    end
  end
end
