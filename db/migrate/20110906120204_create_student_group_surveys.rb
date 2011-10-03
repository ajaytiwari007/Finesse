class CreateStudentGroupSurveys < ActiveRecord::Migration
  def self.up
    create_table :student_group_surveys do |t|
      t.integer :student_group_id
      t.integer :survey_id

      t.timestamps
    end
  end

  def self.down
    drop_table :student_group_surveys
  end
end
