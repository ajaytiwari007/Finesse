class Expense < ActiveRecord::Base
  belongs_to :department
  has_many :round_expenses, :dependent => :destroy
    has_many :rounds, :through => :round_expenses
end
