class CreateEmployees < ActiveRecord::Migration
  def self.up
    create_table :employees do |t|
      t.string :name
      t.integer :factory_id
      t.integer :employee_type_id

      t.timestamps
    end
  end

  def self.down
    drop_table :employees
  end
end
