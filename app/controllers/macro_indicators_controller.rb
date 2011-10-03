class MacroIndicatorsController < ApplicationController
  # GET /macro_indicators
  # GET /macro_indicators.xml
  def index
    @macro_indicators = MacroIndicator.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @macro_indicators }
    end
  end

  # GET /macro_indicators/1
  # GET /macro_indicators/1.xml
  def show
    @macro_indicator = MacroIndicator.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @macro_indicator }
    end
  end

  # GET /macro_indicators/new
  # GET /macro_indicators/new.xml
  def new
    @macro_indicator = MacroIndicator.new
    @macro_indicators = MacroIndicator.all

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @macro_indicator }
    end
  end

  # GET /macro_indicators/1/edit
  def edit
    @macro_indicator = MacroIndicator.find(params[:id])
  end

  # POST /macro_indicators
  # POST /macro_indicators.xml
  def create
    @macro_indicator = MacroIndicator.new(params[:macro_indicator])

    respond_to do |format|
      if @macro_indicator.save
        format.html { redirect_to :new, :notice => 'Macro indicator was successfully created.' }
        format.xml  { render :xml => @macro_indicator, :status => :created, :location => @macro_indicator }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @macro_indicator.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /macro_indicators/1
  # PUT /macro_indicators/1.xml
  def update
    @macro_indicator = MacroIndicator.find(params[:id])

    respond_to do |format|
      if @macro_indicator.update_attributes(params[:macro_indicator])
        format.html { redirect_to(@macro_indicator, :notice => 'Macro indicator was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @macro_indicator.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /macro_indicators/1
  # DELETE /macro_indicators/1.xml
  def destroy
    @macro_indicator = MacroIndicator.find(params[:id])
    @macro_indicator.destroy

    respond_to do |format|
      format.html { redirect_to(macro_indicators_url) }
      format.xml  { head :ok }
    end
  end
end
