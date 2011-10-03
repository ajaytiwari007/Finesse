class Dealer < ActiveRecord::Base

  def save_with_consumer_creation
    #for Creating Consumer_Demographics
    self.save
      rto=[]
      rto[0]=RangeSpecification.last.min_consumer_demographics+rand(1+RangeSpecification.last.max_consumer_demographics-RangeSpecification.last.min_consumer_demographics)
      rto[1]=RangeSpecification.last.min_consumer_demographics+rand(1+RangeSpecification.last.max_consumer_demographics-RangeSpecification.last.min_consumer_demographics)
      rto[2]=RangeSpecification.last.min_consumer_demographics+rand(1+RangeSpecification.last.max_consumer_demographics-RangeSpecification.last.min_consumer_demographics)
      rto[3]=RangeSpecification.last.min_consumer_demographics+rand(1+RangeSpecification.last.max_consumer_demographics-RangeSpecification.last.min_consumer_demographics)
      rto[4]=100-(rto[0]+rto[1]+rto[2]+rto[3])
      5.times do|x|
        @consumer_demographic=ConsumerDemographic.new
        @consumer_demographic.dealer_id=self.id
        @consumer_demographic.consumer_type_id=x+1
        @consumer_demographic.ratio=rto[x]
        @consumer_demographic.save
      end

     #for Incentive_Effect_On_Dealers
      rto=[]
      rto[0]=RangeSpecification.last.min_effect_of_channel_incentive+rand(1+RangeSpecification.last.max_effect_of_channel_incentive-RangeSpecification.last.min_effect_of_channel_incentive)
      rto[1]=RangeSpecification.last.min_effect_of_channel_incentive+rand(1+RangeSpecification.last.max_effect_of_channel_incentive-RangeSpecification.last.min_effect_of_channel_incentive)
      rto[2]=RangeSpecification.last.min_effect_of_channel_incentive+rand(1+RangeSpecification.last.max_effect_of_channel_incentive-RangeSpecification.last.min_effect_of_channel_incentive)
      rto[3]=100-(rto[0]+rto[1]+rto[2])
      4.times do|x|
        @incentive_effect_on_dealer=IncentiveEffectOnDealer.new
        @incentive_effect_on_dealer.dealer_id=self.id
        @incentive_effect_on_dealer.channel_incentive_id=x+1
        @incentive_effect_on_dealer.ratio=rto[x]
        @incentive_effect_on_dealer.save
      end


     #for Consumer Creation
     consumer_catchment.times do|i|

      rto=[]
      rto[0]=RangeSpecification.last.min_effect_of_media+rand(1+RangeSpecification.last.max_effect_of_media-RangeSpecification.last.min_effect_of_media)
      rto[1]=RangeSpecification.last.min_effect_of_channel_incentive+rand(1+RangeSpecification.last.max_effect_of_channel_incentive-RangeSpecification.last.min_effect_of_channel_incentive)
      #rto[2]=RangeSpecification.last.min_effect_of_price+rand(1+RangeSpecification.last.max_effect_of_price-RangeSpecification.last.min_effect_of_price)
      rto[2]=100-rto[0]-rto[1]
       @Consumer=Consumer.new
       @Consumer.dealer_id=self.id
       @Consumer.name=IndianName.new.generate_name
       @Consumer.consumer_type_id=rand(5)+1
       @Consumer.product_type_id=rand(5)+1
       @Consumer.probability_of_purchase=RangeSpecification.last.min_probability_of_purchase+rand(1+RangeSpecification.last.max_probability_of_purchase-RangeSpecification.last.min_probability_of_purchase)
       @Consumer.ratio_of_ad=rto[0]
       @Consumer.ratio_of_channel_push=rto[1]
       @Consumer.ratio_of_price=rto[2]
       @Consumer.save_with_ad_effect_on_consumer
     end

    end
end


