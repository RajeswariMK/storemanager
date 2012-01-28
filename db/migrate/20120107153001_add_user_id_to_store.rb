class AddUserIdToStore < ActiveRecord::Migration
  def self.up
    add_column :stores, :user_id, :integer
  end

  def self.down
    remove_column :stores, :user_id
  end
end
