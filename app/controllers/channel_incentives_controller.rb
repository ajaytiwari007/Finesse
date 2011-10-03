class ChannelIncentivesController < ApplicationController
  # GET /channel_incentives
  # GET /channel_incentives.xml
  def index
    @channel_incentives = ChannelIncentive.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @channel_incentives }
    end
  end

  # GET /channel_incentives/1
  # GET /channel_incentives/1.xml
  def show
    @channel_incentive = ChannelIncentive.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @channel_incentive }
    end
  end

  # GET /channel_incentives/new
  # GET /channel_incentives/new.xml
  def new
    @channel_incentive = ChannelIncentive.new
     @channel_incentives = ChannelIncentive.all

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @channel_incentive }
    end
  end

  # GET /channel_incentives/1/edit
  def edit
    @channel_incentive = ChannelIncentive.find(params[:id])
  end

  # POST /channel_incentives
  # POST /channel_incentives.xml
  def create
    @channel_incentive = ChannelIncentive.new(params[:channel_incentive])

    respond_to do |format|
      if @channel_incentive.save
        format.html { redirect_to(@channel_incentive, :notice => 'Channel incentive was successfully created.') }
        format.xml  { render :xml => @channel_incentive, :status => :created, :location => @channel_incentive }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @channel_incentive.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /channel_incentives/1
  # PUT /channel_incentives/1.xml
  def update
    @channel_incentive = ChannelIncentive.find(params[:id])

    respond_to do |format|
      if @channel_incentive.update_attributes(params[:channel_incentive])
        format.html { redirect_to(@channel_incentive, :notice => 'Channel incentive was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @channel_incentive.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /channel_incentives/1
  # DELETE /channel_incentives/1.xml
  def destroy
    @channel_incentive = ChannelIncentive.find(params[:id])
    @channel_incentive.destroy

    respond_to do |format|
      format.html { redirect_to(channel_incentives_url) }
      format.xml  { head :ok }
    end
  end
end
