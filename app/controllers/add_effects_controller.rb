class AddEffectsController < ApplicationController
  # GET /add_effects
  # GET /add_effects.xml
  def index
    @add_effects = AddEffect.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @add_effects }
    end
  end

  # GET /add_effects/1
  # GET /add_effects/1.xml
  def show
    @add_effect = AddEffect.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @add_effect }
    end
  end

  # GET /add_effects/new
  # GET /add_effects/new.xml
  def new
    @add_effect = AddEffect.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @add_effect }
    end
  end

  # GET /add_effects/1/edit
  def edit
    @add_effect = AddEffect.find(params[:id])
  end

  # POST /add_effects
  # POST /add_effects.xml
  def create
    @add_effect = AddEffect.new(params[:add_effect])

    respond_to do |format|
      if @add_effect.save
        format.html { redirect_to(@add_effect, :notice => 'Add effect was successfully created.') }
        format.xml  { render :xml => @add_effect, :status => :created, :location => @add_effect }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @add_effect.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /add_effects/1
  # PUT /add_effects/1.xml
  def update
    @add_effect = AddEffect.find(params[:id])

    respond_to do |format|
      if @add_effect.update_attributes(params[:add_effect])
        format.html { redirect_to(@add_effect, :notice => 'Add effect was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @add_effect.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /add_effects/1
  # DELETE /add_effects/1.xml
  def destroy
    @add_effect = AddEffect.find(params[:id])
    @add_effect.destroy

    respond_to do |format|
      format.html { redirect_to(add_effects_url) }
      format.xml  { head :ok }
    end
  end
end
