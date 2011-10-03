class FactoriesController < ApplicationController
  # GET /factories
  # GET /factories.xml

  def index
    #Factory.delete_all
    @factories = Factory.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @factories }
    end
  end

    # GET /factories/1
    # GET /factories/1.xml
  def show
    @factory = Factory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @factory }
    end
  end

    # GET /factories/new
    # GET /factories/new.xml
  def new
    @factory = Factory.new
     @factories = Factory.all

    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @factory }
    end

  end

    # GET /factories/1/edit
  def edit
    @factory = Factory.find(params[:id])
  end

    # POST /factories
    # POST /factories.xml
  def create
    @factory = Factory.new(params[:factory])

    respond_to do |format|
      if @factory.save
        @factory.create_dealers
        format.html { redirect_to :new ,:notice => 'Factory was successfully created.'}
        format.xml { render :xml => @factory, :status => :created, :location => @factory }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @factory.errors, :status => :unprocessable_entity }
      end
    end


  end

    # PUT /factories/1
    # PUT /factories/1.xml
  def update
    @factory = Factory.find(params[:id])

    respond_to do |format|
      if @factory.update_attributes(params[:factory])
        format.html { redirect_to(@factory, :notice => 'Factory was successfully updated.') }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @factory.errors, :status => :unprocessable_entity }
      end
    end
  end

    # DELETE /factories/1
    # DELETE /factories/1.xml
  def destroy
    @factory = Factory.find(params[:id])
    @factory.destroy

    respond_to do |format|
      format.html { redirect_to(factories_url) }
      format.xml { head :ok }
    end
  end
end
