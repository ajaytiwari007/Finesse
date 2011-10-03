class CreateRangeSpecifications < ActiveRecord::Migration
  def self.up
    create_table :range_specifications do |t|
      t.integer :min_effect_of_hr_incentive
      t.integer :max_effect_of_hr_incentive
      t.integer :min_effect_of_channel_incentive
      t.integer :max_effect_of_channel_incentive
      t.integer :min_effect_of_media
      t.integer :max_effect_of_media
      t.integer :min_dealer_catchment
      t.integer :max_dealer_catchment
      t.integer :min_consumer_catchment
      t.integer :max_consumer_catchment
      t.integer :min_employee_count
      t.integer :max_employee_count
      t.integer :min_consumer_demographics
     t.integer :max_consumer_demographics
      t.integer:min_probability_of_purchase
     t.integer:max_probability_of_purchase
      t.integer :min_effect_of_price
      t.integer :max_effect_of_price

      t.timestamps
    end
  end

  def self.down
    drop_table :range_specifications
  end
end
