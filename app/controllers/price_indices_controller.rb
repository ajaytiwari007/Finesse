class PriceIndicesController < ApplicationController
  # GET /price_indices
  # GET /price_indices.xml
  
   def calculate_price_index
     @player=Player.find(params[:player_id])
     @round=Round.find(params[:round_id])
     #redirect_to :action => "delete_all_price_indices",:player_id=>@player.id,:round_id=>@round.id and return
     prices_sum=0.0.to_f
     price_fact=0.0
     @brands=Brand.all
     @brands.each do |brand|
       prices_sum+=brand.price.to_f
     end
     @brands.each do |brand|
       price_fact+=(prices_sum/brand.price.to_f)
     end
     @brands.each do |brand|
        @price_index=PriceIndex.new
        @price_index.round_id=@round.id
        @price_index.brand_id=brand.id
        index=(100/+price_fact.to_f)*(prices_sum/brand.price.to_f)
        @price_index.price_index=index.to_f
        @price_index.save
     end

     #redirect_to :action => 'index'
       redirect_to :controller => :channel_indices,:action => "calculate_channel_index",:player_id=>@player.id,:round_id=>@round.id
   end

   def delete_all_price_indices
     if params[:player_id]!=nil and params[:round_id]!=nil
     @price_indices=PriceIndex.find(:all,:conditions => ["player_id=? and round_id=?",params[:player_id],params[:round_id]])
     else
       @price_indices=PriceIndex.all
     end
     @price_indices.delete(:all)
     #redirect_to :action => 'index'

   end
  
  
  def index
    @price_indices = PriceIndex.all
    @price_index=PriceIndex.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @price_indices }
    end
  end

  # GET /price_indices/1
  # GET /price_indices/1.xml
  def show
    @price_index = PriceIndex.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @price_index }
    end
  end

  # GET /price_indices/new
  # GET /price_indices/new.xml
  def new
    @price_index = PriceIndex.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @price_index }
    end
  end

  # GET /price_indices/1/edit
  def edit
    @price_index = PriceIndex.find(params[:id])
  end

  # POST /price_indices
  # POST /price_indices.xml
  def create
    @price_index = PriceIndex.new(params[:price_index])

    respond_to do |format|
      if @price_index.save
        format.html { redirect_to(:controller => :price_indices,:action => "index", :notice => 'Price index was successfully created.') }
        format.xml  { render :xml => @price_index, :status => :created, :location => @price_index }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @price_index.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /price_indices/1
  # PUT /price_indices/1.xml
  def update
    @price_index = PriceIndex.find(params[:id])

    respond_to do |format|
      if @price_index.update_attributes(params[:price_index])
        format.html { redirect_to(@price_index, :notice => 'Price index was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @price_index.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /price_indices/1
  # DELETE /price_indices/1.xml
  def destroy
    @price_index = PriceIndex.find(params[:id])
    @price_index.destroy

    respond_to do |format|
      format.html { redirect_to(price_indices_url) }
      format.xml  { head :ok }
    end
  end
end
