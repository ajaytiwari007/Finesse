class EmployeeDemographicsController < ApplicationController
  # GET /employee_demographics
  # GET /employee_demographics.xml
  def index
    @employee_demographics = EmployeeDemographic.all
    @employee_demographic=EmployeeDemographic.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @employee_demographics }
    end
  end

  # GET /employee_demographics/1
  # GET /employee_demographics/1.xml
  def show
    @employee_demographic = EmployeeDemographic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @employee_demographic }
    end
  end

  # GET /employee_demographics/new
  # GET /employee_demographics/new.xml
  def new
    @employee_demographic = EmployeeDemographic.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @employee_demographic }
    end
  end

  # GET /employee_demographics/1/edit
  def edit
    @employee_demographic = EmployeeDemographic.find(params[:id])
  end

  # POST /employee_demographics
  # POST /employee_demographics.xml
  def create
    @employee_demographic = EmployeeDemographic.new(params[:employee_demographic])

    respond_to do |format|
      if @employee_demographic.save
        format.html { redirect_to(:controller => :employee_demographics,:action => "index", :notice => 'Employee demographic was successfully created.') }
        format.xml  { render :xml => @employee_demographic, :status => :created, :location => @employee_demographic }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @employee_demographic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /employee_demographics/1
  # PUT /employee_demographics/1.xml
  def update
    @employee_demographic = EmployeeDemographic.find(params[:id])

    respond_to do |format|
      if @employee_demographic.update_attributes(params[:employee_demographic])
        format.html { redirect_to(@employee_demographic, :notice => 'Employee demographic was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @employee_demographic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_demographics/1
  # DELETE /employee_demographics/1.xml
  def destroy
    @employee_demographic = EmployeeDemographic.find(params[:id])
    @employee_demographic.destroy

    respond_to do |format|
      format.html { redirect_to(employee_demographics_url) }
      format.xml  { head :ok }
    end
  end
end
