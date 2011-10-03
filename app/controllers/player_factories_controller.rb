class PlayerFactoriesController < ApplicationController
  # GET /player_factories
  # GET /player_factories.xml
  def index
    @player_factories = PlayerFactory.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @player_factories }
    end
  end

  # GET /player_factories/1
  # GET /player_factories/1.xml
  def show
    @player_factory = PlayerFactory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @player_factory }
    end
  end

  # GET /player_factories/new
  # GET /player_factories/new.xml
  def new

    @player=Player.find(params[:player_id])
    @player_factory = PlayerFactory.new
    if Pnl.find_last_by_player_id(params[:player_id])
    round_id = Pnl.find_last_by_player_id(params[:player_id]).round_id+1
      else
      round_id=1
    end
    @round=Round.find(round_id)
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @player_factory }
    end
  end

  # GET /player_factories/1/edit
  def edit
    @player_factory = PlayerFactory.find(params[:id])
  end

  # POST /player_factories
  # POST /player_factories.xml
  def create
    @player_factory = PlayerFactory.new(params[:player_factory])

    respond_to do |format|
      if @player_factory.save
        format.html { redirect_to(@player_factory, :notice => 'Player factory was successfully created.') }
        format.xml  { render :xml => @player_factory, :status => :created, :location => @player_factory }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @player_factory.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /player_factories/1
  # PUT /player_factories/1.xml
  def update
    @player_factory = PlayerFactory.find(params[:id])

    respond_to do |format|
      if @player_factory.update_attributes(params[:player_factory])
        format.html { redirect_to(@player_factory, :notice => 'Player factory was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @player_factory.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /player_factories/1
  # DELETE /player_factories/1.xml
  def destroy
    @player_factory = PlayerFactory.find(params[:id])
    @player_factory.destroy

    respond_to do |format|
      format.html { redirect_to(player_factories_url) }
      format.xml  { head :ok }
    end
  end

  def mod_db

    #@factory = Factory.find(params[:factory_id])
   # @player_factory=PlayerFactory.find(:first,:conditions=>['player_id=? and factory_id=?',@player.id,params[:factory_id]])
   # @player_factory.active=true
   # @player_factory.factory_id
   # @player_factory.save
    # redirect_to new_player_factory_path


  end

  def buy_factory

    @player=Player.find(params[:player_id])
    @player_factory=PlayerFactory.new
    @player_factory.player_id=@player.id
    @player_factory.factory_id=params[:factory_id]
    @player_factory.active=true
    @player_factory.save
    redirect_to new_player_factory_path(:player_id=>@player.id)
  end



end
