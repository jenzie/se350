class AddEmailToThinker < ActiveRecord::Migration
  def self.up
    add_column :thinkers, :email, :string
  end

  def self.down
    remove_column :thinkers, :email
  end
end
