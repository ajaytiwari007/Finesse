class CreateEmployeeDemographics < ActiveRecord::Migration
  def self.up
    create_table :employee_demographics do |t|
      t.integer :case_study_id
      t.integer :employee_type_id
      t.integer :ratio

      t.timestamps
    end
  end

  def self.down
    drop_table :employee_demographics
  end
end
