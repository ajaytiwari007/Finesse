class CreateSelectedChannelIncentives < ActiveRecord::Migration
  def self.up
    create_table :selected_channel_incentives do |t|
      t.integer :channel_incentive_for_round_id
      t.integer :brand_id
      t.boolean :active
      t.integer :value
      t.integer :channel_incentive_cost

      t.timestamps
    end
  end

  def self.down
    drop_table :selected_channel_incentives
  end
end
