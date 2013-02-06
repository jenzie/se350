class AddAuthorsToSong < ActiveRecord::Migration
  def self.up
    add_column :songs, :author_id, :integer
  end

  def self.down
    remove_column :songs, :author_id
  end
end
