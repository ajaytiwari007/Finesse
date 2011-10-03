class StudentGroupUser < ActiveRecord::Base
 belongs_to :student_group
  belongs_to :user

end
