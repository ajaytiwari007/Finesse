class CreateRoundExpenses < ActiveRecord::Migration
  def self.up
    create_table :round_expenses do |t|
      t.integer :round_id
      t.integer :expense_id

      t.timestamps
    end
  end

  def self.down
    drop_table :round_expenses
  end
end
