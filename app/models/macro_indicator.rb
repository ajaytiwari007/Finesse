class MacroIndicator < ActiveRecord::Base
  has_many :macro_indicator_options, :dependent => :destroy
end
