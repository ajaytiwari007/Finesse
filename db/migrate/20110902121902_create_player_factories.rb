class CreatePlayerFactories < ActiveRecord::Migration
  def self.up
    create_table :player_factories do |t|
      t.integer :player_id
      t.integer :factory_id
      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :player_factories
  end
end
