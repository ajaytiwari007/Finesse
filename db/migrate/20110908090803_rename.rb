class Rename < ActiveRecord::Migration
  def self.up
    rename_column :hr_incentives, :type, :active;
  end

  def self.down
  end
end
