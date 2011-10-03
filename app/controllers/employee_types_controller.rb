class EmployeeTypesController < ApplicationController
  # GET /employee_types
  # GET /employee_types.xml
  def index
    @employee_types = EmployeeType.all
    @employee_type=EmployeeType.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @employee_types }
    end
  end

  # GET /employee_types/1
  # GET /employee_types/1.xml
  def show
    @employee_type = EmployeeType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @employee_type }
    end
  end

  # GET /employee_types/new
  # GET /employee_types/new.xml
  def new
    @employee_type = EmployeeType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @employee_type }
    end
  end

  # GET /employee_types/1/edit
  def edit
    @employee_type = EmployeeType.find(params[:id])
  end

  # POST /employee_types
  # POST /employee_types.xml
  def create
    @employee_type = EmployeeType.new(params[:employee_type])

    respond_to do |format|
      if @employee_type.save
        format.html { redirect_to(:controller => :employee_types,:action => "index", :notice => 'Employee type was successfully created.') }
        format.xml  { render :xml => @employee_type, :status => :created, :location => @employee_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @employee_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /employee_types/1
  # PUT /employee_types/1.xml
  def update
    @employee_type = EmployeeType.find(params[:id])

    respond_to do |format|
      if @employee_type.update_attributes(params[:employee_type])
        format.html { redirect_to(@employee_type, :notice => 'Employee type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @employee_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_types/1
  # DELETE /employee_types/1.xml
  def destroy
    @employee_type = EmployeeType.find(params[:id])
    @employee_type.destroy

    respond_to do |format|
      format.html { redirect_to(employee_types_url) }
      format.xml  { head :ok }
    end
  end
end
