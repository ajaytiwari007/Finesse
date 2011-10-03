class SelectedMediaController < ApplicationController
  # GET /selected_media
  # GET /selected_media.xml
  def index
    @selected_media = SelectedMedium.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @selected_media }
    end
  end

  # GET /selected_media/1
  # GET /selected_media/1.xml
  def show
    @selected_medium = SelectedMedium.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @selected_medium }
    end
  end

  # GET /selected_media/new
  # GET /selected_media/new.xml
  def new
    @brand = Brand.find(params[:brand_id])
    @all_media=Medium.all
    @selected_medium = Array.new(@all_media.count) { SelectedMedium.new }
    @round=Round.find(params[:round_id])
  end

  # GET /selected_media/1/edit
  def edit
    @selected_medium = SelectedMedium.find(params[:id])
  end

  # POST /selected_media
  # POST /selected_media.xml
  def create
        @brand = Brand.find(params[:brand_id])
        @selected_media = params[:selected_media].values.collect { |selected_medium| SelectedMedium.new(selected_medium) }
        @all_media=Medium.all
        @checked_medium_ids=Array.new
        @round=Round.find(params[:round_id])
        if @selected_media.all?(&:valid?)
          @selected_media.each do |sgu|
            if sgu.media_id and sgu.media_id!=0
              if SelectedMedium.find(:first,:conditions=>["brand_id=? and round_id=? and media_id=?",sgu.brand_id,@round.id,sgu.media_id])
                @checked_medium_ids<<sgu.media_id
              else
                @checked_medium_ids<<sgu.media_id
                sgu.advertising_cost=(50+rand(50))*1000
                sgu.round_id=@round.id
                sgu.save!
              end
            end
          end
          @all_media.each do |medium|
            if @exsgr=SelectedMedium.find(:first,:conditions => ["brand_id=? AND media_id=?",params[:brand_id],medium.id])
              if !@checked_medium_ids.include?(@exsgr.media_id)
                @exsgr.destroy
              end
            end
          end
          # redirect_to :action => 'new' ,:brand_id=>params[:brand],:round_id=>@round.id
           redirect_to :controller => :price_indices,:action => "calculate_price_index",:player_id=>@brand.player_id,:round_id=>@round.id
        else
          render :action => 'new'
        end
  end

  # PUT /selected_media/1
  # PUT /selected_media/1.xml
  def update
    @selected_medium = SelectedMedium.find(params[:id])

    respond_to do |format|
      if @selected_medium.update_attributes(params[:selected_medium])
        format.html { redirect_to(@selected_medium, :notice => 'Selected medium was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @selected_medium.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /selected_media/1
  # DELETE /selected_media/1.xml
  def destroy
    @selected_medium = SelectedMedium.find(params[:id])
    @selected_medium.destroy

    respond_to do |format|
      format.html { redirect_to(selected_media_url) }
      format.xml  { head :ok }
    end
  end
end
