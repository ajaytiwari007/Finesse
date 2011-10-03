class CreateLoans < ActiveRecord::Migration
  def self.up
    create_table :loans do |t|
      t.integer :round_id
      t.integer :player_id
      t.integer :amount
      t.decimal :rate
      t.integer :start_round_id
      t.integer :end_round_id

      t.timestamps
    end
  end

  def self.down
    drop_table :loans
  end
end
