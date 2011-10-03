class CreateFacilitators < ActiveRecord::Migration
  def self.up
    create_table :facilitators do |t|
      t.string :name
      t.integer :client_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :facilitators
  end
end
