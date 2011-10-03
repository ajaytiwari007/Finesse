class CreateEmployeeExpenses < ActiveRecord::Migration
  def self.up
    create_table :employee_expenses do |t|
      t.integer :round_id
      t.integer :player_id
      t.integer :employee_efficiency

      t.timestamps
    end
  end

  def self.down
    drop_table :employee_expenses
  end
end
