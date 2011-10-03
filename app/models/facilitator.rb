class Facilitator < ActiveRecord::Base
  belongs_to :client
  has_many :facilitator_groups, :dependent => :destroy
end
