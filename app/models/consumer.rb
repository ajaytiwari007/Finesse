class Consumer < ActiveRecord::Base
  #for Ad_Effect_On_Consumer
  def save_with_ad_effect_on_consumer
    self.save
     rto=[]
      rto[0]=RangeSpecification.last.min_effect_of_media+rand(1+RangeSpecification.last.max_effect_of_media-RangeSpecification.last.min_effect_of_media)
      rto[1]=RangeSpecification.last.min_effect_of_media+rand(1+RangeSpecification.last.max_effect_of_media-RangeSpecification.last.min_effect_of_media)
      rto[2]=RangeSpecification.last.min_effect_of_media+rand(1+RangeSpecification.last.max_effect_of_media-RangeSpecification.last.min_effect_of_media)
      rto[3]=RangeSpecification.last.min_effect_of_media+rand(1+RangeSpecification.last.max_effect_of_media-RangeSpecification.last.min_effect_of_media)
      rto[4]=RangeSpecification.last.min_effect_of_media+rand(1+RangeSpecification.last.max_effect_of_media-RangeSpecification.last.min_effect_of_media)
      rto[5]=100-(rto[0]+rto[1]+rto[2]+rto[3]+rto[4])
    6.times do |i|
      @ad_effect_on_consumer=AdEffectOnConsumer.new
      @ad_effect_on_consumer.consumer_id=self.id
      @ad_effect_on_consumer.media_id=i
      @ad_effect_on_consumer.ratio=rto[i]
      @ad_effect_on_consumer.save
    end
  end
end