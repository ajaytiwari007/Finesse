class CreateStudentGroupCaseStudies < ActiveRecord::Migration
  def self.up
    create_table :student_group_case_studies do |t|
      t.integer :student_group_id
      t.integer :case_study_id

      t.timestamps
    end
  end

  def self.down
    drop_table :student_group_case_studies
  end
end
