class RangeSpecificationsController < ApplicationController
  # GET /range_specifications
  # GET /range_specifications.xml
  def index
    @range_specifications = RangeSpecification.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @range_specifications }
    end
  end

  # GET /range_specifications/1
  # GET /range_specifications/1.xml
  def show
    @range_specification = RangeSpecification.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @range_specification }
    end
  end

  # GET /range_specifications/new
  # GET /range_specifications/new.xml
  def new
    @range_specification = RangeSpecification.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @range_specification }
    end
  end

  # GET /range_specifications/1/edit
  def edit
    @range_specification = RangeSpecification.find(params[:id])
  end

  # POST /range_specifications
  # POST /range_specifications.xml
  def create
    @range_specification = RangeSpecification.new(params[:range_specification])

    respond_to do |format|
      if @range_specification.save
        format.html { redirect_to(@range_specification, :notice => 'Range specification was successfully created.') }
        format.xml  { render :xml => @range_specification, :status => :created, :location => @range_specification }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @range_specification.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /range_specifications/1
  # PUT /range_specifications/1.xml
  def update
    @range_specification = RangeSpecification.find(params[:id])

    respond_to do |format|
      if @range_specification.update_attributes(params[:range_specification])
        format.html { redirect_to(@range_specification, :notice => 'Range specification was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @range_specification.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /range_specifications/1
  # DELETE /range_specifications/1.xml
  def destroy
    @range_specification = RangeSpecification.find(params[:id])
    @range_specification.destroy

    respond_to do |format|
      format.html { redirect_to(range_specifications_url) }
      format.xml  { head :ok }
    end
  end
end
