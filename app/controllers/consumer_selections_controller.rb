class ConsumerSelectionsController < ApplicationController
  # GET /consumer_selections
  # GET /consumer_selections.xml

  def calculate_consumer_selection
    @player=Player.find(params[:player_id])
    @consumers=Consumer.all
    @round=Round.find(params[:round_id])
    @consumers.each do |consumer|
      @consumer_selection=ConsumerSelection.new
      @consumer_selection.customer_id=consumer.id
      @consumer_selection.round_id=@round.id
      selected_brand_id=nil
      max_brand_score=0
      @brands=Brand.all
      @brands.each do |brand|
        #if(ChannelIndex.maximum(:channel_index,:conditions => ['dealer_id=?',consumer.dealer_id])==ChannelIndex.find(:first,:conditions => ['dealer_id=? and brand_id=?',consumer.dealer_id,brand.id]).channel_index)
          ad_index_score=consumer.ratio_of_ad*AdIndex.find_by_brand_id(brand.id).ad_index
          channel_index_score=consumer.ratio_of_channel_push*ChannelIndex.find(:first,:conditions => ['brand_id=? and dealer_id=?',brand.id,consumer.dealer_id]).channel_index
          price_index_score=consumer.ratio_of_price*PriceIndex.find_by_brand_id(brand.id).price_index
          brand_score=ad_index_score+channel_index_score+price_index_score
            if(max_brand_score<brand_score)
              selected_brand_id=brand.id
              max_brand_score=brand_score
            end
         # end
      end
      @consumer_selection.brand_id=selected_brand_id
      if(rand(100)<=consumer.probability_of_purchase)
        @consumer_selection.purchase=true
      else
        @consumer_selection.purchase=false
      end
      @consumer_selection.save
    end
    redirect_to :controller => :productions,:action => "get_production",:player_id=>@player.id,:round_id=>@round.id
end

   def delete_all_consumer_selections
     ConsumerSelection.delete_all
     #@consumers=Consumer.all
     #@consumers.each do |consumer|
      # if(consumer.dealer_id>48 or consumer.dealer_id<45)
       #  consumer.destroy
       #end
     #end
     redirect_to :action => 'index'
   end

  def index
    @consumer_selections = ConsumerSelection.all
    @consumer_selection=ConsumerSelection.new
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @consumer_selections }
    end
  end

  # GET /consumer_selections/1
  # GET /consumer_selections/1.xml
  def show
    @consumer_selection = ConsumerSelection.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @consumer_selection }
    end
  end

  # GET /consumer_selections/new
  # GET /consumer_selections/new.xml
  def new
    @consumer_selection = ConsumerSelection.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @consumer_selection }
    end
  end

  # GET /consumer_selections/1/edit
  def edit
    @consumer_selection = ConsumerSelection.find(params[:id])
  end

  # POST /consumer_selections
  # POST /consumer_selections.xml
  def create
    @consumer_selection = ConsumerSelection.new(params[:consumer_selection])

    respond_to do |format|
      if @consumer_selection.save
        format.html { redirect_to(:controller => :consumer_selection,:action => "index", :notice => 'Consumer selection was successfully created.') }
        format.xml  { render :xml => @consumer_selection, :status => :created, :location => @consumer_selection }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @consumer_selection.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /consumer_selections/1
  # PUT /consumer_selections/1.xml
  def update
    @consumer_selection = ConsumerSelection.find(params[:id])

    respond_to do |format|
      if @consumer_selection.update_attributes(params[:consumer_selection])
        format.html { redirect_to(@consumer_selection, :notice => 'Consumer selection was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @consumer_selection.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /consumer_selections/1
  # DELETE /consumer_selections/1.xml
  def destroy
    @consumer_selection = ConsumerSelection.find(params[:id])
    @consumer_selection.destroy

    respond_to do |format|
      format.html { redirect_to(consumer_selections_url) }
      format.xml  { head :ok }
    end
  end
end
