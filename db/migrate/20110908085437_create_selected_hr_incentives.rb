class CreateSelectedHrIncentives < ActiveRecord::Migration
  def self.up
    create_table :selected_hr_incentives do |t|
      t.integer :player_id
      t.boolean :active
      t.integer :value
      t.integer :hr_incentive_cost
      t.integer :hr_incentive_for_round_id

      t.timestamps
    end
  end

  def self.down
    drop_table :selected_hr_incentives
  end
end
