class StudentGroup < ActiveRecord::Base
  attr_accessible :name,:facilitator_group_id,:case_study_id,:student_group_users_attributes
  belongs_to :facilitator_group
  has_many :student_group_users, :dependent => :destroy
  has_many :users,:through => :student_group_users
  has_many :student_group_case_studies, :dependent => :destroy
  has_many :case_studies, :through => :student_group_case_studies
  accepts_nested_attributes_for :student_group_users, :reject_if => lambda {|a| a[:user_id].to_i ==0}
end
