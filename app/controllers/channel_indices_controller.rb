class ChannelIndicesController < ApplicationController
  # GET /channel_indices
  # GET /channel_indices.xml
  def calculate_channel_index
    @player=Player.find(params[:player_id])
    @dealers=Dealer.all
    @round=Round.find(params[:round_id])
   # redirect_to :action => "delete_all_channel_indices",:player_id=>@player.id,:round_id=>@round.id and return
    @dealers.each do |dealer|
      @brands=Brand.all
      @brands.each do |brand|
         @channel_index=ChannelIndex.new
         @channel_index.dealer_id=dealer.id
         @channel_index.round_id=@round.id
         @channel_index.brand_id=brand.id
         index=0.0
         @channel_incentives_for_rounds=ChannelIncentiveForRound.find_all_by_round_id(@round.id)
         @channel_incentives_for_rounds.each do |channel_incentive_for_round|
           @incentive_effect_on_dealer=IncentiveEffectOnDealer.find(:first,:conditions => ['dealer_id=? and channel_incentive_id=?',dealer.id,channel_incentive_for_round.channel_incentive_id])
           if SelectedChannelIncentive.find(:last,:conditions => ['brand_id=? and channel_incentive_for_round_id=?',brand.id,channel_incentive_for_round.id])!=nil
             index+=(@incentive_effect_on_dealer.ratio.to_f/SelectedChannelIncentive.count(:conditions => ['channel_incentive_for_round_id=?',channel_incentive_for_round.id])).to_f
             end
         end
        @channel_index.channel_index=index
        @channel_index.save
      end
    end
   # redirect_to :action => 'index'
     redirect_to :controller => :ad_indices,:action => "calculate_ad_index",:player_id=>@player.id,:round_id=>@round.id
  end

  def delete_all_channel_indices

    if params[:player_id]!=nil and params[:round_id]!=nil
     @channel_indices=ChannelIndex.find(:all,:conditions => ["player_id=? and round_id=?",params[:player_id],params[:round_id]])
     else
       @channel_indices=ChannelIndex.all
     end
     @channel_indices.delete(:all)

#    ChannelIndex.delete_all
 #   redirect_to :action => 'index'
  end

  def index

    @channel_indices = ChannelIndex.all
    @channel_index=ChannelIndex.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @channel_indices }
    end
  end

  # GET /channel_indices/1
  # GET /channel_indices/1.xml
  def show
    @channel_index = ChannelIndex.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @channel_index }
    end
  end

  # GET /channel_indices/new
  # GET /channel_indices/new.xml
  def new
    @channel_index = ChannelIndex.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @channel_index }
    end
  end

  # GET /channel_indices/1/edit
  def edit
    @channel_index = ChannelIndex.find(params[:id])
  end

  # POST /channel_indices
  # POST /channel_indices.xml
  def create
    @channel_index = ChannelIndex.new(params[:channel_index])

    respond_to do |format|
      if @channel_index.save
        format.html { redirect_to(:controller => :channel_indices,:action => "index", :notice => 'Channel index was successfully created.') }
        format.xml  { render :xml => @channel_index, :status => :created, :location => @channel_index }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @channel_index.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /channel_indices/1
  # PUT /channel_indices/1.xml
  def update
    @channel_index = ChannelIndex.find(params[:id])

    respond_to do |format|
      if @channel_index.update_attributes(params[:channel_index])
        format.html { redirect_to(@channel_index, :notice => 'Channel index was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @channel_index.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /channel_indices/1
  # DELETE /channel_indices/1.xml
  def destroy
    @channel_index = ChannelIndex.find(params[:id])
    @channel_index.destroy

    respond_to do |format|
      format.html { redirect_to(channel_indices_url) }
      format.xml  { head :ok }
    end
  end
end
