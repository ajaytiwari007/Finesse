class CreateConsumerDemographics < ActiveRecord::Migration
  def self.up
    create_table :consumer_demographics do |t|
      t.integer :dealer_id
      t.integer :consumer_type_id
      t.integer :ratio

      t.timestamps
    end
  end

  def self.down
    drop_table :consumer_demographics
  end
end
