class CreateChannelIncentiveForRounds < ActiveRecord::Migration
  def self.up
    create_table :channel_incentive_for_rounds do |t|
      t.integer :channel_incentive_id
      t.integer :round_id

      t.timestamps
    end
  end

  def self.down
    drop_table :channel_incentive_for_rounds
  end
end
