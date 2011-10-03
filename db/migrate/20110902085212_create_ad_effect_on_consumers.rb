class CreateAdEffectOnConsumers < ActiveRecord::Migration
  def self.up
    create_table :ad_effect_on_consumers do |t|
      t.integer :consumer_id
      t.integer :media_id
      t.integer :ratio

      t.timestamps
    end
  end

  def self.down
    drop_table :ad_effect_on_consumers
  end
end
