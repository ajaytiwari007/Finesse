class CreateExpenseForRounds < ActiveRecord::Migration
  def self.up
    create_table :expense_for_rounds do |t|
      t.integer :round_id
      t.integer :expense_id

      t.timestamps
    end
  end

  def self.down
    drop_table :expense_for_rounds
  end
end
