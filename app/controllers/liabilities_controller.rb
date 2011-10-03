class LiabilitiesController < ApplicationController
  # GET /liabilities
  # GET /liabilities.xml
  def index
    @liabilities = Liability.all
    @liability=Liability.new
       respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @liabilities }
    end
  end

  # GET /liabilities/1
  # GET /liabilities/1.xml
  def show
    @liability = Liability.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @liability }
    end
  end

  # GET /liabilities/new
  # GET /liabilities/new.xml
  def new
    @liability = Liability.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @liability }
    end
  end

  # GET /liabilities/1/edit
  def edit
    @liability = Liability.find(params[:id])
  end

  # POST /liabilities
  # POST /liabilities.xml
  def create
    @liability = Liability.new(params[:liability])



    respond_to do |format|
      if @liability.save
        @liability=Liability.last
        @asset=Asset.find(:last,:conditions => ['round_id=? AND player_id=?',@liability.round_id,@liability.player_id])



    @liability.net_worth= (@asset.fixed_assets + @asset.cash + @asset.investments + @asset.inventory)-(@liability.long_term_loans + @liability.short_term_loans);
    @liability.save
        format.html { redirect_to(:controller => :liabilities,:action => "index", :notice => 'Liability was successfully created.') }
        format.xml  { render :xml => @liability, :status => :created, :location => @liability }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @liability.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /liabilities/1
  # PUT /liabilities/1.xml
  def update
    @liability = Liability.find(params[:id])

    respond_to do |format|
      if @liability.update_attributes(params[:liability])
        format.html { redirect_to(@liability, :notice => 'Liability was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @liability.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /liabilities/1
  # DELETE /liabilities/1.xml
  def destroy
    @liability = Liability.find(params[:id])
    @liability.destroy

    respond_to do |format|
      format.html { redirect_to(liabilities_url) }
      format.xml  { head :ok }
    end
  end
end
