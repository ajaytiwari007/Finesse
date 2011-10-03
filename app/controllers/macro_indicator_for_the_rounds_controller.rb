class MacroIndicatorForTheRoundsController < ApplicationController
  # GET /macro_indicator_for_the_rounds
  # GET /macro_indicator_for_the_rounds.xml
  def index
    @macro_indicator_for_the_rounds = MacroIndicatorForTheRound.all
    @macro_indicator_for_the_round=MacroIndicatorForTheRound.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @macro_indicator_for_the_rounds }
    end
  end

  # GET /macro_indicator_for_the_rounds/1
  # GET /macro_indicator_for_the_rounds/1.xml
  def show
    @macro_indicator_for_the_round = MacroIndicatorForTheRound.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @macro_indicator_for_the_round }
    end
  end

  # GET /macro_indicator_for_the_rounds/new
  # GET /macro_indicator_for_the_rounds/new.xml
  def new
    @macro_indicator_for_the_round = MacroIndicatorForTheRound.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @macro_indicator_for_the_round }
    end
  end

  # GET /macro_indicator_for_the_rounds/1/edit
  def edit
    @macro_indicator_for_the_round = MacroIndicatorForTheRound.find(params[:id])
  end

  # POST /macro_indicator_for_the_rounds
  # POST /macro_indicator_for_the_rounds.xml
  def create
    @macro_indicator_for_the_round = MacroIndicatorForTheRound.new(params[:macro_indicator_for_the_round])

    respond_to do |format|
      if @macro_indicator_for_the_round.save
        format.html { redirect_to(:controller => :macro_indicator_for_the_rounds,:action => "index", :notice => 'Macro indicator for the round was successfully created.') }
        format.xml  { render :xml => @macro_indicator_for_the_round, :status => :created, :location => @macro_indicator_for_the_round }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @macro_indicator_for_the_round.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /macro_indicator_for_the_rounds/1
  # PUT /macro_indicator_for_the_rounds/1.xml
  def update
    @macro_indicator_for_the_round = MacroIndicatorForTheRound.find(params[:id])

    respond_to do |format|
      if @macro_indicator_for_the_round.update_attributes(params[:macro_indicator_for_the_round])
        format.html { redirect_to(@macro_indicator_for_the_round, :notice => 'Macro indicator for the round was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @macro_indicator_for_the_round.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /macro_indicator_for_the_rounds/1
  # DELETE /macro_indicator_for_the_rounds/1.xml
  def destroy
    @macro_indicator_for_the_round = MacroIndicatorForTheRound.find(params[:id])
    @macro_indicator_for_the_round.destroy

    respond_to do |format|
      format.html { redirect_to(macro_indicator_for_the_rounds_url) }
      format.xml  { head :ok }
    end
  end
end
