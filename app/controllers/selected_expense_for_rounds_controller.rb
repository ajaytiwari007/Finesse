class SelectedExpenseForRoundsController < ApplicationController
  # GET /selected_expense_for_rounds
  # GET /selected_expense_for_rounds.xml
  def index
    @selected_expense_for_rounds = SelectedExpenseForRound.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @selected_expense_for_rounds }
    end
  end

  # GET /selected_expense_for_rounds/1
  # GET /selected_expense_for_rounds/1.xml
  def show
    @selected_expense_for_round = SelectedExpenseForRound.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @selected_expense_for_round }
    end
  end

  # GET /selected_expense_for_rounds/new
  # GET /selected_expense_for_rounds/new.xml
  def new
    @selected_expense_for_round = SelectedExpenseForRound.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @selected_expense_for_round }
    end
  end

  # GET /selected_expense_for_rounds/1/edit
  def edit
    @selected_expense_for_round = SelectedExpenseForRound.find(params[:id])
  end

  # POST /selected_expense_for_rounds
  # POST /selected_expense_for_rounds.xml
  def create
    @selected_expense_for_round = SelectedExpenseForRound.new(params[:selected_expense_for_round])

    respond_to do |format|
      if @selected_expense_for_round.save
        format.html { redirect_to(@selected_expense_for_round, :notice => 'Selected expense for round was successfully created.') }
        format.xml  { render :xml => @selected_expense_for_round, :status => :created, :location => @selected_expense_for_round }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @selected_expense_for_round.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /selected_expense_for_rounds/1
  # PUT /selected_expense_for_rounds/1.xml
  def update
    @selected_expense_for_round = SelectedExpenseForRound.find(params[:id])

    respond_to do |format|
      if @selected_expense_for_round.update_attributes(params[:selected_expense_for_round])
        format.html { redirect_to(@selected_expense_for_round, :notice => 'Selected expense for round was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @selected_expense_for_round.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /selected_expense_for_rounds/1
  # DELETE /selected_expense_for_rounds/1.xml
  def destroy
    @selected_expense_for_round = SelectedExpenseForRound.find(params[:id])
    @selected_expense_for_round.destroy

    respond_to do |format|
      format.html { redirect_to(selected_expense_for_rounds_url) }
      format.xml  { head :ok }
    end
  end
end
