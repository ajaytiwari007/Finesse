class CreateProductions < ActiveRecord::Migration
  def self.up
    create_table :productions do |t|
      t.integer :round_id
      t.integer :player_id
      t.boolean :active
      t.integer :quantity
      t.integer :production_cost
      t.integer :factory_id

      t.timestamps
    end
  end

  def self.down
    drop_table :productions
  end
end
