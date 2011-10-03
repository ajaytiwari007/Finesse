class CreateHrIncentiveForRounds < ActiveRecord::Migration
  def self.up
    create_table :hr_incentive_for_rounds do |t|
      t.integer :round_id
      t.integer :hr_incentive_id

      t.timestamps
    end
  end

  def self.down
    drop_table :hr_incentive_for_rounds
  end
end
