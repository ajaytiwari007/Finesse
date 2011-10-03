class RemoveColumn1 < ActiveRecord::Migration
  def self.up
    remove_column :case_studies,:student_group_case_study_id
  end

  def self.down
     remove_column :case_studies,:student_group_case_study_id
  end
end
