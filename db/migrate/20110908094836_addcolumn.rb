class Addcolumn < ActiveRecord::Migration
  def self.up
    add_column :selected_hr_incentives,:hr_incentive_id,:integer
  end

  def self.down
 remove_column :selected_hr_incentives,:hr_incentive_id,:integer
  end
end
