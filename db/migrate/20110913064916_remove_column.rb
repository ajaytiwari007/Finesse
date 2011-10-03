class RemoveColumn < ActiveRecord::Migration
  def self.up
    remove_column :selected_hr_incentives, :hr_incentive_id
  end

  def self.down
 remove_column :selected_hr_incentives, :hr_incentive_id
  end
end
