class HrIncentivesController < ApplicationController
  # GET /hr_incentives
  # GET /hr_incentives.xml
  def index
    @hr_incentives = HrIncentive.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @hr_incentives }
    end
  end

  # GET /hr_incentives/1
  # GET /hr_incentives/1.xml
  def show
    @hr_incentive = HrIncentive.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @hr_incentive }
    end
  end

  # GET /hr_incentives/new
  # GET /hr_incentives/new.xml
  def new
    @hr_incentive = HrIncentive.new
    @hr_incentives = HrIncentive.all

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @hr_incentive }
    end
  end

  # GET /hr_incentives/1/edit
  def edit
    @hr_incentive = HrIncentive.find(params[:id])
  end

  # POST /hr_incentives
  # POST /hr_incentives.xml
  def create
    @hr_incentive = HrIncentive.new(params[:hr_incentive])

    respond_to do |format|
      if @hr_incentive.save
        format.html { redirect_to(@hr_incentive, :notice => 'Hr incentive was successfully created.') }
        format.xml  { render :xml => @hr_incentive, :status => :created, :location => @hr_incentive }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @hr_incentive.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /hr_incentives/1
  # PUT /hr_incentives/1.xml
  def update
    @hr_incentive = HrIncentive.find(params[:id])

    respond_to do |format|
      if @hr_incentive.update_attributes(params[:hr_incentive])
        format.html { redirect_to(@hr_incentive, :notice => 'Hr incentive was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @hr_incentive.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /hr_incentives/1
  # DELETE /hr_incentives/1.xml
  def destroy
    @hr_incentive = HrIncentive.find(params[:id])
    @hr_incentive.destroy

    respond_to do |format|
      format.html { redirect_to(hr_incentives_url) }
      format.xml  { head :ok }
    end
  end
end
