class Round < ActiveRecord::Base

    attr_accessible :name,:case_study_id,:round_expenses_attributes,:macro_indicator_for_rounds_attributes
    belongs_to :case_study
    has_many :macro_indicator_for_rounds ,:dependent =>:destroy
    has_many :macro_indicator_options, :through => :macro_indicator_for_rounds
    has_many :round_expenses, :dependent => :destroy
    has_many :expenses, :through => :round_expenses
    has_many :macro_indicator_for_rounds, :dependent=>:destroy
    accepts_nested_attributes_for :round_expenses, :reject_if => lambda {|a| a[:expense_id].to_i ==0}
    accepts_nested_attributes_for :macro_indicator_for_rounds, :reject_if => lambda {|b| b[:macro_indicator_option_id].to_i ==0}


end
