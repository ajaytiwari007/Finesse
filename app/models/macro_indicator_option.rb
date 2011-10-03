class MacroIndicatorOption < ActiveRecord::Base
  belongs_to :macro_indicator
  has_many :macro_indicator_for_rounds ,:dependent => :destroy
  has_many :rounds ,:through => :macro_indicator_for_rounds
end
