class AdEffectOnConsumersController < ApplicationController
  # GET /ad_effect_on_consumers
  # GET /ad_effect_on_consumers.xml
  def index
    AdEffectOnConsumer.delete_all
    @ad_effect_on_consumers = AdEffectOnConsumer.all
    @ad_effect_on_consumer=AdEffectOnConsumer.new
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ad_effect_on_consumers }
    end
  end

  # GET /ad_effect_on_consumers/1
  # GET /ad_effect_on_consumers/1.xml
  def show
    @ad_effect_on_consumer = AdEffectOnConsumer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ad_effect_on_consumer }
    end
  end

  # GET /ad_effect_on_consumers/new
  # GET /ad_effect_on_consumers/new.xml
  def new
    @ad_effect_on_consumer = AdEffectOnConsumer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ad_effect_on_consumer }
    end
  end

  # GET /ad_effect_on_consumers/1/edit
  def edit
    @ad_effect_on_consumer = AdEffectOnConsumer.find(params[:id])
  end

  # POST /ad_effect_on_consumers
  # POST /ad_effect_on_consumers.xml
  def create
    @ad_effect_on_consumer = AdEffectOnConsumer.new(params[:ad_effect_on_consumer])

    respond_to do |format|
      if @ad_effect_on_consumer.save
        format.html { redirect_to(:controller => :ad_effect_on_consumers, :action => "index",:notice => 'Ad effect on consumer was successfully created.') }
        format.xml  { render :xml => @ad_effect_on_consumer, :status => :created, :location => @ad_effect_on_consumer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ad_effect_on_consumer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ad_effect_on_consumers/1
  # PUT /ad_effect_on_consumers/1.xml
  def update
    @ad_effect_on_consumer = AdEffectOnConsumer.find(params[:id])

    respond_to do |format|
      if @ad_effect_on_consumer.update_attributes(params[:ad_effect_on_consumer])
        format.html { redirect_to(@ad_effect_on_consumer, :notice => 'Ad effect on consumer was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ad_effect_on_consumer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ad_effect_on_consumers/1
  # DELETE /ad_effect_on_consumers/1.xml
  def destroy
    @ad_effect_on_consumer = AdEffectOnConsumer.find(params[:id])
    @ad_effect_on_consumer.destroy

    respond_to do |format|
      format.html { redirect_to(ad_effect_on_consumers_url) }
      format.xml  { head :ok }
    end
  end
end
