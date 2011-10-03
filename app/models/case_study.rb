class CaseStudy < ActiveRecord::Base
  has_many :student_group_case_studies, :dependent => :destroy
  has_many :student_groups, :through => :student_group_case_studies
  has_many :rounds, :dependent => :destroy
end
