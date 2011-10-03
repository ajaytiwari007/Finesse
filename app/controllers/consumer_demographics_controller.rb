class ConsumerDemographicsController < ApplicationController
  # GET /consumer_demographics
  # GET /consumer_demographics.xml
  def index
    #ConsumerDemographic.delete_all
    @consumer_demographics = ConsumerDemographic.all
    @consumer_demographic=ConsumerDemographic.new
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @consumer_demographics }
    end
  end

  # GET /consumer_demographics/1
  # GET /consumer_demographics/1.xml
  def show
    @consumer_demographic = ConsumerDemographic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @consumer_demographic }
    end
  end

  # GET /consumer_demographics/new
  # GET /consumer_demographics/new.xml
  def new
    @consumer_demographic = ConsumerDemographic.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @consumer_demographic }
    end
  end

  # GET /consumer_demographics/1/edit
  def edit
    @consumer_demographic = ConsumerDemographic.find(params[:id])
  end

  # POST /consumer_demographics
  # POST /consumer_demographics.xml
  def create
    @consumer_demographic = ConsumerDemographic.new(params[:consumer_demographic])

    respond_to do |format|
      if @consumer_demographic.save
        format.html { redirect_to(:controller => :consumer_demographics,:action => "index", :notice => 'Consumer demographic was successfully created.') }
        format.xml  { render :xml => @consumer_demographic, :status => :created, :location => @consumer_demographic }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @consumer_demographic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /consumer_demographics/1
  # PUT /consumer_demographics/1.xml
  def update
    @consumer_demographic = ConsumerDemographic.find(params[:id])

    respond_to do |format|
      if @consumer_demographic.update_attributes(params[:consumer_demographic])
        format.html { redirect_to(@consumer_demographic, :notice => 'Consumer demographic was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @consumer_demographic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /consumer_demographics/1
  # DELETE /consumer_demographics/1.xml
  def destroy
    @consumer_demographic = ConsumerDemographic.find(params[:id])
    @consumer_demographic.destroy

    respond_to do |format|
      format.html { redirect_to(consumer_demographics_url) }
      format.xml  { head :ok }
    end
  end
end
