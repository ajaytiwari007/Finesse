class RoundExpense < ActiveRecord::Base
  belongs_to :round
  belongs_to :expense
end
