class ConsumerTypesController < ApplicationController
  # GET /consumer_types
  # GET /consumer_types.xml
  def index
    @consumer_types = ConsumerType.all
    @consumer_type=ConsumerType.new
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @consumer_types }
    end
  end

  # GET /consumer_types/1
  # GET /consumer_types/1.xml
  def show
    @consumer_type = ConsumerType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @consumer_type }
    end
  end

  # GET /consumer_types/new
  # GET /consumer_types/new.xml
  def new
    @consumer_type = ConsumerType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @consumer_type }
    end
  end

  # GET /consumer_types/1/edit
  def edit
    @consumer_type = ConsumerType.find(params[:id])
  end

  # POST /consumer_types
  # POST /consumer_types.xml
  def create
    @consumer_type = ConsumerType.new(params[:consumer_type])

    respond_to do |format|
      if @consumer_type.save
        format.html { redirect_to(:controller => :consumer_types,:action => "index", :notice => 'Consumer type was successfully created.') }
        format.xml  { render :xml => @consumer_type, :status => :created, :location => @consumer_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @consumer_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /consumer_types/1
  # PUT /consumer_types/1.xml
  def update
    @consumer_type = ConsumerType.find(params[:id])

    respond_to do |format|
      if @consumer_type.update_attributes(params[:consumer_type])
        format.html { redirect_to(@consumer_type, :notice => 'Consumer type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @consumer_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /consumer_types/1
  # DELETE /consumer_types/1.xml
  def destroy
    @consumer_type = ConsumerType.find(params[:id])
    @consumer_type.destroy

    respond_to do |format|
      format.html { redirect_to(consumer_types_url) }
      format.xml  { head :ok }
    end
  end
end
