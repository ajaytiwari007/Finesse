class FactoryInput < ActiveRecord::Base
 has_many :product_compositions , :dependent=>:destroy
 has_many:product_types,:through => :product_compositions


end
