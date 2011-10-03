class CreateCaseStudies < ActiveRecord::Migration
  def self.up
    create_table :case_studies do |t|
      t.string :name
      t.integer :max_round
      t.integer :student_group_case_study_id

      t.timestamps
    end
  end

  def self.down
    drop_table :case_studies
  end
end
