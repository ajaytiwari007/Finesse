class ProductType < ActiveRecord::Base
  has_many :product_compositions,:dependent=>:destroy
  has_many :factory_inputs, :through => :product_compositions
  attr_accessible :name,:product_type_id,:factory_input_id,:product_compositions_attributes,:factory_inputs_attributes
  accepts_nested_attributes_for :product_compositions, :reject_if => lambda {|c| c[:factory_input_id].to_i ==0}

end
