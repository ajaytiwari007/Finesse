class FacilitatorGroup < ActiveRecord::Base
  belongs_to :facilitator
  has_many :users,:dependent => :destroy
  has_many :student_groups,:dependent => :destroy
end
