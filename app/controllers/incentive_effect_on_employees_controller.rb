class IncentiveEffectOnEmployeesController < ApplicationController
  # GET /incentive_effect_on_employees
  # GET /incentive_effect_on_employees.xml
  def index
    @incentive_effect_on_employees = IncentiveEffectOnEmployee.all
    @incentive_effect_on_employee=IncentiveEffectOnEmployee.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @incentive_effect_on_employees }
    end
  end

  # GET /incentive_effect_on_employees/1
  # GET /incentive_effect_on_employees/1.xml
  def show
    @incentive_effect_on_employee = IncentiveEffectOnEmployee.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @incentive_effect_on_employee }
    end
  end

  # GET /incentive_effect_on_employees/new
  # GET /incentive_effect_on_employees/new.xml
  def new
    @incentive_effect_on_employee = IncentiveEffectOnEmployee.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @incentive_effect_on_employee }
    end
  end

  # GET /incentive_effect_on_employees/1/edit
  def edit
    @incentive_effect_on_employee = IncentiveEffectOnEmployee.find(params[:id])
  end

  # POST /incentive_effect_on_employees
  # POST /incentive_effect_on_employees.xml
  def create
    @incentive_effect_on_employee = IncentiveEffectOnEmployee.new(params[:incentive_effect_on_employee])

    respond_to do |format|
      if @incentive_effect_on_employee.save
        format.html { redirect_to(:controller => :incentive_effect_on_employees,:action => "index", :notice => 'Incentive effect on employee was successfully created.') }
        format.xml  { render :xml => @incentive_effect_on_employee, :status => :created, :location => @incentive_effect_on_employee }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @incentive_effect_on_employee.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /incentive_effect_on_employees/1
  # PUT /incentive_effect_on_employees/1.xml
  def update
    @incentive_effect_on_employee = IncentiveEffectOnEmployee.find(params[:id])

    respond_to do |format|
      if @incentive_effect_on_employee.update_attributes(params[:incentive_effect_on_employee])
        format.html { redirect_to(@incentive_effect_on_employee, :notice => 'Incentive effect on employee was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @incentive_effect_on_employee.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /incentive_effect_on_employees/1
  # DELETE /incentive_effect_on_employees/1.xml
  def destroy
    @incentive_effect_on_employee = IncentiveEffectOnEmployee.find(params[:id])
    @incentive_effect_on_employee.destroy

    respond_to do |format|
      format.html { redirect_to(incentive_effect_on_employees_url) }
      format.xml  { head :ok }
    end
  end
end
