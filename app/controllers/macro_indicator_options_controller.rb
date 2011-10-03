class MacroIndicatorOptionsController < ApplicationController
  # GET /macro_indicator_options
  # GET /macro_indicator_options.xml
  def index
    if(params[:macro_indicator_id].nil?)
    @macro_indicator_options = MacroIndicatorOption.all
    else
     @macro_indicator=MacroIndicator.find(params[:macro_indicator_id])
     @macro_indicator_options=@macro_indicator.macro_indicator_options
     end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @macro_indicator_options }
    end
  end

  # GET /macro_indicator_options/1
  # GET /macro_indicator_options/1.xml
  def show
    @macro_indicator_option = MacroIndicatorOption.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @macro_indicator_option }
    end
  end

  # GET /macro_indicator_options/new
  # GET /macro_indicator_options/new.xml
  def new
    @macro_indicator_option = MacroIndicatorOption.new
     @macro_indicator_options = MacroIndicatorOption.all
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @macro_indicator_option }
    end
  end

  # GET /macro_indicator_options/1/edit
  def edit
    @macro_indicator_option = MacroIndicatorOption.find(params[:id])
  end

  # POST /macro_indicator_options
  # POST /macro_indicator_options.xml
  def create
    @macro_indicator_option = MacroIndicatorOption.new(params[:macro_indicator_option])

    respond_to do |format|
      if @macro_indicator_option.save
        format.html { redirect_to :new, :notice => 'Macro indicator option was successfully created.' }
        format.xml  { render :xml => @macro_indicator_option, :status => :created, :location => @macro_indicator_option }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @macro_indicator_option.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /macro_indicator_options/1
  # PUT /macro_indicator_options/1.xml
  def update
    @macro_indicator_option = MacroIndicatorOption.find(params[:id])

    respond_to do |format|
      if @macro_indicator_option.update_attributes(params[:macro_indicator_option])
        format.html { redirect_to(@macro_indicator_option, :notice => 'Macro indicator option was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @macro_indicator_option.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /macro_indicator_options/1
  # DELETE /macro_indicator_options/1.xml
  def destroy
    @macro_indicator_option = MacroIndicatorOption.find(params[:id])
    @macro_indicator_option.destroy

    respond_to do |format|
      format.html { redirect_to(macro_indicator_options_url) }
      format.xml  { head :ok }
    end
  end
end
