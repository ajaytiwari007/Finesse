class StudentGroupCaseStudy < ActiveRecord::Base
  belongs_to :student_group
  belongs_to :case_study
end
