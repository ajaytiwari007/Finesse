class ProductCompositionsController < ApplicationController
  # GET /product_compositions
  # GET /product_compositions.xml
  def index
    @product_compositions = ProductComposition.all


    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @product_compositions }
    end
  end

  # GET /product_compositions/1
  # GET /product_compositions/1.xml
  def show
    @product_composition = ProductComposition.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product_composition }
    end
  end

  # GET /product_compositions/new
  # GET /product_compositions/new.xml
  def new
    @product_composition = ProductComposition.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product_composition }
    end
  end

  # GET /product_compositions/1/edit
  def edit
    @product_composition = ProductComposition.find(params[:id])
  end

  # POST /product_compositions
  # POST /product_compositions.xml
  def create
    @product_composition = ProductComposition.new(params[:product_composition])

    respond_to do |format|
      if @product_composition.save
        format.html { redirect_to(:controller => :product_compositions,:action => "index", :notice => 'Product composition was successfully created.') }
        format.xml  { render :xml => @product_composition, :status => :created, :location => @product_composition }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product_composition.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /product_compositions/1
  # PUT /product_compositions/1.xml
  def update
    @product_composition = ProductComposition.find(params[:id])

    respond_to do |format|
      if @product_composition.update_attributes(params[:product_composition])
        format.html { redirect_to(@product_composition, :notice => 'Product composition was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product_composition.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /product_compositions/1
  # DELETE /product_compositions/1.xml
  def destroy
    @product_composition = ProductComposition.find(params[:id])
    @product_composition.destroy

    respond_to do |format|
      format.html { redirect_to(product_compositions_url) }
      format.xml  { head :ok }
    end
  end
end
