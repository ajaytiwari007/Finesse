class ChannelIncentiveForRoundsController < ApplicationController
  # GET /channel_incentive_for_rounds
  # GET /channel_incentive_for_rounds.xml
  def index
    @channel_incentive_for_rounds = ChannelIncentiveForRound.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @channel_incentive_for_rounds }
    end
  end

  # GET /channel_incentive_for_rounds/1
  # GET /channel_incentive_for_rounds/1.xml
  def show
    @channel_incentive_for_round = ChannelIncentiveForRound.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @channel_incentive_for_round }
    end
  end

  # GET /channel_incentive_for_rounds/new
  # GET /channel_incentive_for_rounds/new.xml
  def new
    @channel_incentive_for_round = ChannelIncentiveForRound.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @channel_incentive_for_round }
    end
  end

  # GET /channel_incentive_for_rounds/1/edit
  def edit
    @channel_incentive_for_round = ChannelIncentiveForRound.find(params[:id])
  end

  # POST /channel_incentive_for_rounds
  # POST /channel_incentive_for_rounds.xml
  def create
    @channel_incentive_for_round = ChannelIncentiveForRound.new(params[:channel_incentive_for_round])

    respond_to do |format|
      if @channel_incentive_for_round.save
        format.html { redirect_to(@channel_incentive_for_round, :notice => 'Channel incentive for round was successfully created.') }
        format.xml  { render :xml => @channel_incentive_for_round, :status => :created, :location => @channel_incentive_for_round }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @channel_incentive_for_round.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /channel_incentive_for_rounds/1
  # PUT /channel_incentive_for_rounds/1.xml
  def update
    @channel_incentive_for_round = ChannelIncentiveForRound.find(params[:id])

    respond_to do |format|
      if @channel_incentive_for_round.update_attributes(params[:channel_incentive_for_round])
        format.html { redirect_to(@channel_incentive_for_round, :notice => 'Channel incentive for round was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @channel_incentive_for_round.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /channel_incentive_for_rounds/1
  # DELETE /channel_incentive_for_rounds/1.xml
  def destroy
    @channel_incentive_for_round = ChannelIncentiveForRound.find(params[:id])
    @channel_incentive_for_round.destroy

    respond_to do |format|
      format.html { redirect_to(channel_incentive_for_rounds_url) }
      format.xml  { head :ok }
    end
  end
end
