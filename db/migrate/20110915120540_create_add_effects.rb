class CreateAddEffects < ActiveRecord::Migration
  def self.up
    create_table :add_effects do |t|
      t.integer :media_id
      t.integer :ratio

      t.timestamps
    end
  end

  def self.down
    drop_table :add_effects
  end
end
