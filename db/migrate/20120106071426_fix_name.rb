class FixName < ActiveRecord::Migration
  def self.up
    rename_column :tags, :name, :tag_name
  end

  def self.down
  end
end
