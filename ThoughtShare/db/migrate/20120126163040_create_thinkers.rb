class CreateThinkers < ActiveRecord::Migration
  def change
    create_table :thinkers do |t|
      t.string :name
      t.string :url
      t.timestamps
    end
  end
end
