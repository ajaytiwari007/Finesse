class Factory < ActiveRecord::Base
  def create_dealers
    dealer_catchment.times do |i|
      @dealer_new=Dealer.new
      @dealer_new.name=IndianName.new.generate_name
      @dealer_new.factory_id=self.id
      @dealer_new.consumer_catchment=RangeSpecification.last.min_consumer_catchment+rand(1+RangeSpecification.last.max_consumer_catchment-RangeSpecification.last.min_consumer_catchment)
      @dealer_new.save_with_consumer_creation
    end
  end
end
