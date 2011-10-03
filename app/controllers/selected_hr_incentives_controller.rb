class SelectedHrIncentivesController < ApplicationController
  # GET /selected_hr_incentives
  # GET /selected_hr_incentives.xml
  def index
    @selected_hr_incentives = SelectedHrIncentive.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @selected_hr_incentives }
    end
  end

  # GET /selected_hr_incentives/1
  # GET /selected_hr_incentives/1.xml
  def show
    @selected_hr_incentive = SelectedHrIncentive.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @selected_hr_incentive }
    end
  end

  # GET /selected_hr_incentives/new
  # GET /selected_hr_incentives/new.xml
  def new
    @player = Player.find(params[:player_id])
    @all_hr_incentives=HrIncentive.all
    @selected_hr_incentives = Array.new(@all_hr_incentives.count) { SelectedHrIncentive.new }
    @round=Round.find(params[:round_id])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @selected_hr_incentive }
    end
  end

  # GET /selected_hr_incentives/1/edit
  def edit
    @selected_hr_incentive = SelectedHrIncentive.find(params[:id])
  end

  # POST /selected_hr_incentives
  # POST /selected_hr_incentives.xml
  def create

   @player = Player.find(params[:player_id])
   #@round=Round.find(params[:round_id])
    @selected_hr_incentives = params[:selected_hr_incentives].values.collect { |selected_hr_incentive| SelectedHrIncentive.new(selected_hr_incentive) }
    @all_hr_incentive=HrIncentive.all
    @checked_hr_incentive_ids=Array.new
      @round=Round.find(params[:round_id])
    if @selected_hr_incentives.all?(&:valid?)
      @selected_hr_incentives.each do |shi|
        if shi.hr_incentive_for_round_id and shi.hr_incentive_for_round_id!=0
          if SelectedHrIncentive.find(:first,:conditions=>["player_id=? and hr_incentive_for_round_id=?",shi.player_id,shi.hr_incentive_for_round_id])
            @checked_hr_incentive_ids<<shi.hr_incentive_for_round_id
          else
            @checked_hr_incentive_ids<<shi.hr_incentive_for_round_id
            shi.save!
          end
        end
      end
      @all_hr_incentive.each do |hr_incentive|
        @hifr=HrIncentiveForRound.find(:last,:conditions => ['hr_incentive_id=? and round_id=?',hr_incentive.id,@round.id])
        if @exshi=SelectedHrIncentive.find(:first,:conditions=>["player_id=? and hr_incentive_for_round_id=?",params[:player_id],@hifr.id])
          if !@checked_hr_incentive_ids.include?(@exshi.hr_incentive_for_round_id)
            @exshi.destroy
          end
        end
      end
      #redirect_to :action => 'new' ,:player_id=>params[:player] ,:round_id=>@round.id
      redirect_to new_selected_channel_incentive_path(:brand_id=>Brand.find_by_player_id(@player.id).id,:round_id=>@round.id)
    else
      render :action => 'new'
    end
  end

  # PUT /selected_hr_incentives/1
  # PUT /selected_hr_incentives/1.xml
  def update
    @selected_hr_incentive = SelectedHrIncentive.find(params[:id])

    respond_to do |format|
      if @selected_hr_incentive.update_attributes(params[:selected_hr_incentive])
        format.html { redirect_to(@selected_hr_incentive, :notice => 'Selected hr incentive was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @selected_hr_incentive.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /selected_hr_incentives/1
  # DELETE /selected_hr_incentives/1.xml
  def destroy
    @selected_hr_incentive = SelectedHrIncentive.find(params[:id])
    @selected_hr_incentive.destroy

    respond_to do |format|
      format.html { redirect_to(selected_hr_incentives_url) }
      format.xml  { head :ok }
    end
  end
end
