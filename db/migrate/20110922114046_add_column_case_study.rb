class AddColumnCaseStudy < ActiveRecord::Migration
  def self.up
    add_column :student_groups,:case_study_id,:integer
  end

  def self.down
    remove_column :student_groups,:case_study_id
  end
end
