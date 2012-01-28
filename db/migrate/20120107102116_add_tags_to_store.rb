class AddTagsToStore < ActiveRecord::Migration
  def self.up
    add_column :stores, :tags, :string
  end

  def self.down
    remove_column :stores, :tags
  end
end
