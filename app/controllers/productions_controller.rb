class ProductionsController < ApplicationController
  # GET /productions
  # GET /productions.xml
  def index
    @productions = Production.all
    @production=Production.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @productions }
    end
  end

  # GET /productions/1
  # GET /productions/1.xml
  def show
    @production = Production.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @production }
    end
  end

  # GET /productions/new
  # GET /productions/new.xml
  def new

    @production = Production.new


    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @production }
    end
  end

  # GET /productions/1/edit
  def edit
    @production = Production.find(params[:id])
  end

  # POST /productions
  # POST /productions.xml
  def create
    @production = Production.new(params[:production])
    respond_to do |format|
      if @production.save
         format.html { redirect_to(:controller => :productions,:action => "index", :notice => 'Production was successfully created.') }
         format.xml  { render :xml => @production, :status => :created, :location => @production }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @production.errors, :status => :unprocessable_entity }
      end
    end
  end

  def get_production
    @player = Player.find(params[:player_id])
    @round=Round.find(params[:round_id])
    @player_factories=PlayerFactory.find_all_by_player_id(@player.id)
    @player_factories.each do |factory|
    @production_new=Production.new
    @production_new.player_id=@player.id
    @production_new.round_id=@round.id
    @production_new.factory_id=factory.factory_id
    quantity=ConsumerSelection.count(:conditions => ['round_id=? and brand_id=? and purchase=?',@round.id,Brand.find(:last,:conditions=>['player_id=? and product_type_id=?',@player.id,Factory.find(factory.factory_id).product_type_id]).id, true])
    #quantity=ConsumerSelection.find_all_by_round_id(@round.id).count
    @production_new.quantity=quantity
    production_cost=0
    @product_compositions=ProductComposition.find(:all,:conditions => ['product_type_id=?',Factory.find(factory.factory_id).product_type_id])
    @product_compositions.each do |product_composition|
    production_cost+=((product_composition.ratio)*(product_composition.weight)*(quantity)*(FactoryInputPrice.find_by_factory_input_id(product_composition.factory_input_id).price))/100
    end
    @production_new.production_cost=production_cost
    @production_new.save
    end
    redirect_to :controller=>:pnls,:action=>"manual_new",:player_id=>@player.id ,:round_id=>@round.id
  end



  # PUT /productions/1
  # PUT /productions/1.xml
  def update
    @production = Production.find(params[:id])

    respond_to do |format|
      if @production.update_attributes(params[:production])
        format.html { redirect_to(@production, :notice => 'Production was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @production.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /productions/1
  # DELETE /productions/1.xml
  def destroy
    @production = Production.find(params[:id])
    @production.destroy

    respond_to do |format|
      format.html { redirect_to(productions_url) }
      format.xml  { head :ok }
    end
  end
end
