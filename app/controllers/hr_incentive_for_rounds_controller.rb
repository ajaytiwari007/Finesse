class HrIncentiveForRoundsController < ApplicationController
  # GET /hr_incentive_for_rounds
  # GET /hr_incentive_for_rounds.xml
  def index
    @hr_incentive_for_rounds = HrIncentiveForRound.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @hr_incentive_for_rounds }
    end
  end

  # GET /hr_incentive_for_rounds/1
  # GET /hr_incentive_for_rounds/1.xml
  def show
    @hr_incentive_for_round = HrIncentiveForRound.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @hr_incentive_for_round }
    end
  end

  # GET /hr_incentive_for_rounds/new
  # GET /hr_incentive_for_rounds/new.xml
  def new
    @hr_incentive_for_round = HrIncentiveForRound.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @hr_incentive_for_round }
    end
  end

  # GET /hr_incentive_for_rounds/1/edit
  def edit
    @hr_incentive_for_round = HrIncentiveForRound.find(params[:id])
  end

  # POST /hr_incentive_for_rounds
  # POST /hr_incentive_for_rounds.xml
  def create
    @hr_incentive_for_round = HrIncentiveForRound.new(params[:hr_incentive_for_round])

    respond_to do |format|
      if @hr_incentive_for_round.save
        format.html { redirect_to(@hr_incentive_for_round, :notice => 'Hr incentive for round was successfully created.') }
        format.xml  { render :xml => @hr_incentive_for_round, :status => :created, :location => @hr_incentive_for_round }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @hr_incentive_for_round.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /hr_incentive_for_rounds/1
  # PUT /hr_incentive_for_rounds/1.xml
  def update
    @hr_incentive_for_round = HrIncentiveForRound.find(params[:id])

    respond_to do |format|
      if @hr_incentive_for_round.update_attributes(params[:hr_incentive_for_round])
        format.html { redirect_to(@hr_incentive_for_round, :notice => 'Hr incentive for round was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @hr_incentive_for_round.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /hr_incentive_for_rounds/1
  # DELETE /hr_incentive_for_rounds/1.xml
  def destroy
    @hr_incentive_for_round = HrIncentiveForRound.find(params[:id])
    @hr_incentive_for_round.destroy

    respond_to do |format|
      format.html { redirect_to(hr_incentive_for_rounds_url) }
      format.xml  { head :ok }
    end
  end
end
