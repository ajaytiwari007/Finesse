class ProductComposition < ActiveRecord::Base
  belongs_to :product_type
  belongs_to :factory_input

end
