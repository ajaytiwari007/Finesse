class CreateIncentiveEffectOnDealers < ActiveRecord::Migration
  def self.up
    create_table :incentive_effect_on_dealers do |t|
      t.integer :dealer_id
      t.integer :channel_incentive_id
      t.integer :ratio

      t.timestamps
    end
  end

  def self.down
    drop_table :incentive_effect_on_dealers
  end
end
