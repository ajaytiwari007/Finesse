class CreateSelectedExpenseForRounds < ActiveRecord::Migration
  def self.up
    create_table :selected_expense_for_rounds do |t|
      t.integer :expense_for_round_id
      t.integer :player_id
      t.boolean :active
      t.integer :value

      t.timestamps
    end
  end

  def self.down
    drop_table :selected_expense_for_rounds
  end
end
