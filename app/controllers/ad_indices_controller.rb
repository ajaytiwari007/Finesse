class AdIndicesController < ApplicationController
  # GET /ad_indices
  # GET /ad_indices.xml
  
  def calculate_ad_index
    @player=Player.find(params[:player_id])
     @round=Round.find(params[:round_id])
     @brands=Brand.all
     @brands.each do |brand|
        @ad_index=AdIndex.new
        @ad_index.round_id=@round.id
        @ad_index.brand_id=brand.id
        index=0
        @all_media=Medium.all
        @all_media.each do |medium|
          if SelectedMedium.find(:last,:conditions => ['brand_id=? and round_id=? and media_id=?',brand.id,@round.id,medium.id])!=nil
            index+=AddEffect.find_by_media_id(medium.id).ratio.to_f/SelectedMedium.count(:conditions => ['round_id=? and media_id=?',@round.id,medium.id]).to_f
          end
        end
       @ad_index.ad_index=index
       @ad_index.save
     end

     #redirect_to :action => 'index'
     redirect_to :controller => :consumer_selections,:action => "calculate_consumer_selection",:player_id=>@player.id,:round_id=>@round.id
   end

   def delete_all_ad_indices
     AdIndex.delete_all
     redirect_to :action => 'index'
   end
  
  
  def index
    @ad_indices = AdIndex.all
    @ad_index=AdIndex.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ad_indices }
    end
  end

  # GET /ad_indices/1
  # GET /ad_indices/1.xml
  def show
    @ad_index = AdIndex.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ad_index }
    end
  end

  # GET /ad_indices/new
  # GET /ad_indices/new.xml
  def new
    @ad_index = AdIndex.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ad_index }
    end
  end

  # GET /ad_indices/1/edit
  def edit
    @ad_index = AdIndex.find(params[:id])
  end

  # POST /ad_indices
  # POST /ad_indices.xml
  def create
    @ad_index = AdIndex.new(params[:ad_index])

    respond_to do |format|
      if @ad_index.save
        format.html { redirect_to(:controller=>:ad_indices,:action => "index", :notice => 'Ad index was successfully created.') }
        format.xml  { render :xml => @ad_index, :status => :created, :location => @ad_index }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ad_index.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ad_indices/1
  # PUT /ad_indices/1.xml
  def update
    @ad_index = AdIndex.find(params[:id])

    respond_to do |format|
      if @ad_index.update_attributes(params[:ad_index])
        format.html { redirect_to(@ad_index, :notice => 'Ad index was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ad_index.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ad_indices/1
  # DELETE /ad_indices/1.xml
  def destroy
    @ad_index = AdIndex.find(params[:id])
    @ad_index.destroy

    respond_to do |format|
      format.html { redirect_to(ad_indices_url) }
      format.xml  { head :ok }
    end
  end
end
