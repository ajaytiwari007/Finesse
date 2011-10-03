class CreateSelectedMedia < ActiveRecord::Migration
  def self.up
    create_table :selected_media do |t|
      t.integer :round_id
      t.integer :brand_id
      t.integer :media_id
      t.boolean :active
      t.integer :advertising_cost

      t.timestamps
    end
  end

  def self.down
    drop_table :selected_media
  end
end
