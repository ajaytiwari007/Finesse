class FactoryInputPricesController < ApplicationController
  # GET /factory_input_prices
  # GET /factory_input_prices.xml
  def index
    @factory_input_prices = FactoryInputPrice.all
    @factory_input_price=FactoryInputPrice.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @factory_input_prices }
    end
  end

  # GET /factory_input_prices/1
  # GET /factory_input_prices/1.xml
  def show
    @factory_input_price = FactoryInputPrice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @factory_input_price }
    end
  end

  # GET /factory_input_prices/new
  # GET /factory_input_prices/new.xml
  def new
    @factory_input_price = FactoryInputPrice.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @factory_input_price }
    end
  end

  # GET /factory_input_prices/1/edit
  def edit
    @factory_input_price = FactoryInputPrice.find(params[:id])
  end

  # POST /factory_input_prices
  # POST /factory_input_prices.xml
  def create
    @factory_input_price = FactoryInputPrice.new(params[:factory_input_price])

    respond_to do |format|
      if @factory_input_price.save
        format.html { redirect_to(:controller => :factory_input_prices,:action => "index", :notice => 'Factory input price was successfully created.') }
        format.xml  { render :xml => @factory_input_price, :status => :created, :location => @factory_input_price }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @factory_input_price.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /factory_input_prices/1
  # PUT /factory_input_prices/1.xml
  def update
    @factory_input_price = FactoryInputPrice.find(params[:id])

    respond_to do |format|
      if @factory_input_price.update_attributes(params[:factory_input_price])
        format.html { redirect_to(@factory_input_price, :notice => 'Factory input price was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @factory_input_price.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /factory_input_prices/1
  # DELETE /factory_input_prices/1.xml
  def destroy
    @factory_input_price = FactoryInputPrice.find(params[:id])
    @factory_input_price.destroy

    respond_to do |format|
      format.html { redirect_to(factory_input_prices_url) }
      format.xml  { head :ok }
    end
  end
end
