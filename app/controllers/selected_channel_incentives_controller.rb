class SelectedChannelIncentivesController < ApplicationController
  # GET /selected_channel_incentives
  # GET /selected_channel_incentives.xml
  def index
    @selected_channel_incentives = SelectedChannelIncentive.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @selected_channel_incentives }
    end
  end

  # GET /selected_channel_incentives/1
  # GET /selected_channel_incentives/1.xml
  def show
    @selected_channel_incentive = SelectedChannelIncentive.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @selected_channel_incentive }
    end
  end

  # GET /selected_channel_incentives/new
  # GET /selected_channel_incentives/new.xml
  def new
    @brand = Brand.find(params[:brand_id])
    @all_channel_incentives=ChannelIncentive.all
    @selected_channel_incentives = Array.new(@all_channel_incentives.count) { SelectedChannelIncentive.new }
    @round=Round.find(params[:round_id])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @selected_channel_incentive }
    end
  end

  # GET /selected_channel_incentives/1/edit
  def edit
    @selected_channel_incentive = SelectedChannelIncentive.find(params[:id])
  end

  # POST /selected_channel_incentives
  # POST /selected_channel_incentives.xml
  def create
    #@selected_channel_incentive = SelectedChannelIncentive.new(params[:selected_channel_incentive])

    @brand = Brand.find(params[:brand_id])
    @selected_channel_incentives = params[:selected_channel_incentives].values.collect { |selected_channel_incentive| SelectedChannelIncentive.new(selected_channel_incentive) }
    @all_channel_incentives=ChannelIncentive.all
    @checked_incentive_ids=Array.new
    @round=Round.find(params[:round_id])
    if @selected_channel_incentives.all?(&:valid?)
      @selected_channel_incentives.each do |sgu|
        #@cifr=ChannelIncentiveForRound.find(:last,:conditions => ['channel_incentive_id=? and round_id=?',sgu.channel_incentive_id,@round.id])
        if sgu.channel_incentive_for_round_id and sgu.channel_incentive_for_round_id!=0
          if SelectedChannelIncentive.find(:first,:conditions=>["brand_id=? and channel_incentive_for_round_id=?",sgu.brand_id,sgu.channel_incentive_for_round_id])
            @checked_incentive_ids<<sgu.channel_incentive_for_round_id
          else
            @checked_incentive_ids<<sgu.channel_incentive_for_round_id
            sgu.channel_incentive_cost=(50+rand(100))*100
            sgu.save!
          end
        end
      end
      @all_channel_incentives.each do |channel_incentive|
        @cifr=ChannelIncentiveForRound.find(:last,:conditions => ['channel_incentive_id=? and round_id=?',channel_incentive.id,@round.id])
        if @exsgr=SelectedChannelIncentive.find(:first,:conditions => ["brand_id=? AND channel_incentive_for_round_id=?",params[:brand_id],@cifr.id])
          if !@checked_incentive_ids.include?(@exsgr.channel_incentive_for_round_id)
            @exsgr.destroy
          end
        end
      end
      #redirect_to @brand
      #redirect_to :action => 'new' ,:brand_id=>params[:brand],:round_id=>@round.id
      redirect_to new_selected_medium_path(:brand_id=>@brand.id,:round_id=>@round.id)
    else
      render :action => 'new'
    end

  end

  # PUT /selected_channel_incentives/1
  # PUT /selected_channel_incentives/1.xml
  def update
    @selected_channel_incentive = SelectedChannelIncentive.find(params[:id])

    respond_to do |format|
      if @selected_channel_incentive.update_attributes(params[:selected_channel_incentive])
        format.html { redirect_to(@selected_channel_incentive, :notice => 'Selected channel incentive was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @selected_channel_incentive.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /selected_channel_incentives/1
  # DELETE /selected_channel_incentives/1.xml
  def destroy
    @selected_channel_incentive = SelectedChannelIncentive.find(params[:id])
    @selected_channel_incentive.destroy

    respond_to do |format|
      format.html { redirect_to(selected_channel_incentives_url) }
      format.xml  { head :ok }
    end
  end
end
