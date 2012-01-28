class RemoveNameFromStore < ActiveRecord::Migration
  def self.up
    remove_column :stores, :name
  end

  def self.down
    add_column :stores, :name, :string
  end
end
