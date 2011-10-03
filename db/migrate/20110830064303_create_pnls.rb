class CreatePnls < ActiveRecord::Migration
  def self.up
    create_table :pnls do |t|
      t.integer :round_id
      t.integer :player_id
      t.integer :income
      t.integer :cogs
      t.integer :employee_cost
      t.integer :sga
      t.integer :ebitda
      t.integer :interest
      t.integer :inv_income
      t.integer :depreciation
      t.integer :pbt
      t.integer :tax
      t.integer :pat

      t.timestamps
    end
  end

  def self.down
    drop_table :pnls
  end
end
