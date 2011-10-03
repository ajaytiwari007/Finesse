class FactoryInputCostsController < ApplicationController
  # GET /factory_input_costs
  # GET /factory_input_costs.xml
  def index
    @factory_input_costs = FactoryInputCost.all
    @factory_input_cost=FactoryInputCost.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @factory_input_costs }
    end
  end

  # GET /factory_input_costs/1
  # GET /factory_input_costs/1.xml
  def show
    @factory_input_cost = FactoryInputCost.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @factory_input_cost }
    end
  end

  # GET /factory_input_costs/new
  # GET /factory_input_costs/new.xml
  def new
    @factory_input_cost = FactoryInputCost.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @factory_input_cost }
    end
  end

  # GET /factory_input_costs/1/edit
  def edit
    @factory_input_cost = FactoryInputCost.find(params[:id])
  end

  # POST /factory_input_costs
  # POST /factory_input_costs.xml
  def create
    @factory_input_cost = FactoryInputCost.new(params[:factory_input_cost])

    respond_to do |format|
      if @factory_input_cost.save
        format.html { redirect_to(:controller => :factory_input_costs,:action => "index", :notice => 'Factory input cost was successfully created.') }
        format.xml  { render :xml => @factory_input_cost, :status => :created, :location => @factory_input_cost }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @factory_input_cost.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /factory_input_costs/1
  # PUT /factory_input_costs/1.xml
  def update
    @factory_input_cost = FactoryInputCost.find(params[:id])

    respond_to do |format|
      if @factory_input_cost.update_attributes(params[:factory_input_cost])
        format.html { redirect_to(@factory_input_cost, :notice => 'Factory input cost was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @factory_input_cost.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /factory_input_costs/1
  # DELETE /factory_input_costs/1.xml
  def destroy
    @factory_input_cost = FactoryInputCost.find(params[:id])
    @factory_input_cost.destroy

    respond_to do |format|
      format.html { redirect_to(factory_input_costs_url) }
      format.xml  { head :ok }
    end
  end
end
