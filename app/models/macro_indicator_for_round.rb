class MacroIndicatorForRound < ActiveRecord::Base

  belongs_to :round
  belongs_to :macro_indicator_option

end
