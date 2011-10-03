class Client < ActiveRecord::Base
  has_many :facilitators,:dependent => :destroy
end
