class IncentiveEffectOnDealersController < ApplicationController
  # GET /incentive_effect_on_dealers
  # GET /incentive_effect_on_dealers.xml
  def index
    #IncentiveEffectOnDealer.delete_all
    @incentive_effect_on_dealers = IncentiveEffectOnDealer.all
    @incentive_effect_on_dealer=IncentiveEffectOnDealer.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @incentive_effect_on_dealers }
    end
  end

  # GET /incentive_effect_on_dealers/1
  # GET /incentive_effect_on_dealers/1.xml
  def show
    @incentive_effect_on_dealer = IncentiveEffectOnDealer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @incentive_effect_on_dealer }
    end
  end

  # GET /incentive_effect_on_dealers/new
  # GET /incentive_effect_on_dealers/new.xml
  def new
    @incentive_effect_on_dealer = IncentiveEffectOnDealer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @incentive_effect_on_dealer }
    end
  end

  # GET /incentive_effect_on_dealers/1/edit
  def edit
    @incentive_effect_on_dealer = IncentiveEffectOnDealer.find(params[:id])
  end

  # POST /incentive_effect_on_dealers
  # POST /incentive_effect_on_dealers.xml
  def create
    @incentive_effect_on_dealer = IncentiveEffectOnDealer.new(params[:incentive_effect_on_dealer])

    respond_to do |format|
      if @incentive_effect_on_dealer.save
        format.html { redirect_to(:controller => :incentive_effect_on_dealers,:action => "index", :notice => 'Incentive effect on dealer was successfully created.') }
        format.xml  { render :xml => @incentive_effect_on_dealer, :status => :created, :location => @incentive_effect_on_dealer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @incentive_effect_on_dealer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /incentive_effect_on_dealers/1
  # PUT /incentive_effect_on_dealers/1.xml
  def update
    @incentive_effect_on_dealer = IncentiveEffectOnDealer.find(params[:id])

    respond_to do |format|
      if @incentive_effect_on_dealer.update_attributes(params[:incentive_effect_on_dealer])
        format.html { redirect_to(@incentive_effect_on_dealer, :notice => 'Incentive effect on dealer was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @incentive_effect_on_dealer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /incentive_effect_on_dealers/1
  # DELETE /incentive_effect_on_dealers/1.xml
  def destroy
    @incentive_effect_on_dealer = IncentiveEffectOnDealer.find(params[:id])
    @incentive_effect_on_dealer.destroy

    respond_to do |format|
      format.html { redirect_to(incentive_effect_on_dealers_url) }
      format.xml  { head :ok }
    end
  end
end
