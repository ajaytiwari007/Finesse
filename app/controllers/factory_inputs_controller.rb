class FactoryInputsController < ApplicationController
  # GET /factory_inputs
  # GET /factory_inputs.xml
  def index
    @factory_inputs = FactoryInput.all
    @factory_input=FactoryInput.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @factory_inputs }
    end
  end

  # GET /factory_inputs/1
  # GET /factory_inputs/1.xml
  def show
    @factory_input = FactoryInput.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @factory_input }
    end
  end

  # GET /factory_inputs/new
  # GET /factory_inputs/new.xml
  def new
    @factory_input = FactoryInput.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @factory_input }
    end
  end

  # GET /factory_inputs/1/edit
  def edit
    @factory_input = FactoryInput.find(params[:id])
  end

  # POST /factory_inputs
  # POST /factory_inputs.xml
  def create
    @factory_input = FactoryInput.new(params[:factory_input])

    respond_to do |format|
      if @factory_input.save
        format.html { redirect_to(:controller => :factory_inputs,:action => "index", :notice => 'Factory input was successfully created.') }
        format.xml  { render :xml => @factory_input, :status => :created, :location => @factory_input }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @factory_input.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /factory_inputs/1
  # PUT /factory_inputs/1.xml
  def update
    @factory_input = FactoryInput.find(params[:id])

    respond_to do |format|
      if @factory_input.update_attributes(params[:factory_input])
        format.html { redirect_to(@factory_input, :notice => 'Factory input was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @factory_input.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /factory_inputs/1
  # DELETE /factory_inputs/1.xml
  def destroy
    @factory_input = FactoryInput.find(params[:id])
    @factory_input.destroy

    respond_to do |format|
      format.html { redirect_to(factory_inputs_url) }
      format.xml  { head :ok }
    end
  end
end
