class DealersController < ApplicationController
  # GET /dealers
  # GET /dealers.xml
  def index
    #Dealer.delete_all
    @dealers = Dealer.all
    @dealer=Dealer.new
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @dealers }
    end
  end

  # GET /dealers/1
  # GET /dealers/1.xml
  def show
    @dealer = Dealer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dealer }
    end
  end

  # GET /dealers/new
  # GET /dealers/new.xml
  def new
    @dealer = Dealer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @dealer }
    end
  end

  # GET /dealers/1/edit
  def edit
    @dealer = Dealer.find(params[:id])
  end

  # POST /dealers
  # POST /dealers.xml
  def create
    @dealer = Dealer.new(params[:dealer])

    respond_to do |format|
      if @dealer.save
        format.html { redirect_to(:controller => :dealers, :action => "index",:notice => 'Dealer was successfully created.') }
        format.xml  { render :xml => @dealer, :status => :created, :location => @dealer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @dealer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /dealers/1
  # PUT /dealers/1.xml
  def update
    @dealer = Dealer.find(params[:id])

    respond_to do |format|
      if @dealer.update_attributes(params[:dealer])
        format.html { redirect_to(@dealer, :notice => 'Dealer was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @dealer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /dealers/1
  # DELETE /dealers/1.xml
  def destroy
    @dealer = Dealer.find(params[:id])
    @dealer.destroy

    respond_to do |format|
      format.html { redirect_to(dealers_url) }
      format.xml  { head :ok }
    end
  end
end
