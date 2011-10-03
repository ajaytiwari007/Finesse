class InvestmentTypesController < ApplicationController
  # GET /investment_types
  # GET /investment_types.xml
  def index
    @investment_types = InvestmentType.all
    @investment_type=InvestmentType.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @investment_types }
    end
  end

  # GET /investment_types/1
  # GET /investment_types/1.xml
  def show
    @investment_type = InvestmentType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @investment_type }
    end
  end

  # GET /investment_types/new
  # GET /investment_types/new.xml
  def new
    @investment_type = InvestmentType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @investment_type }
    end
  end

  # GET /investment_types/1/edit
  def edit
    @investment_type = InvestmentType.find(params[:id])
  end

  # POST /investment_types
  # POST /investment_types.xml
  def create
    @investment_type = InvestmentType.new(params[:investment_type])

    respond_to do |format|
      if @investment_type.save
        format.html { redirect_to(:controller => :investment_types,:action => "index", :notice => 'Investment type was successfully created.') }
        format.xml  { render :xml => @investment_type, :status => :created, :location => @investment_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @investment_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /investment_types/1
  # PUT /investment_types/1.xml
  def update
    @investment_type = InvestmentType.find(params[:id])

    respond_to do |format|
      if @investment_type.update_attributes(params[:investment_type])
        format.html { redirect_to(@investment_type, :notice => 'Investment type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @investment_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /investment_types/1
  # DELETE /investment_types/1.xml
  def destroy
    @investment_type = InvestmentType.find(params[:id])
    @investment_type.destroy

    respond_to do |format|
      format.html { redirect_to(investment_types_url) }
      format.xml  { head :ok }
    end
  end
end
