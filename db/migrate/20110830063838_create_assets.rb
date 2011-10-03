 class CreateAssets < ActiveRecord::Migration
  def self.up
    create_table :assets do |t|
      t.integer :round_id
      t.integer :player_id
      t.integer :fixed_assets
      t.integer :investments
      t.integer :inventory
      t.integer :cash

      t.timestamps
    end
  end

  def self.down
    drop_table :assets
  end
end
