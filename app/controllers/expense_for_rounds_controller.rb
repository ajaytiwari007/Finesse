class ExpenseForRoundsController < ApplicationController
  # GET /expense_for_rounds
  # GET /expense_for_rounds.xml
  def index
    @expense_for_rounds = ExpenseForRound.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @expense_for_rounds }
    end
  end

  # GET /expense_for_rounds/1
  # GET /expense_for_rounds/1.xml
  def show
    @expense_for_round = ExpenseForRound.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @expense_for_round }
    end
  end

  # GET /expense_for_rounds/new
  # GET /expense_for_rounds/new.xml
  def new
    @expense_for_round = ExpenseForRound.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @expense_for_round }
    end
  end

  # GET /expense_for_rounds/1/edit
  def edit
    @expense_for_round = ExpenseForRound.find(params[:id])
  end

  # POST /expense_for_rounds
  # POST /expense_for_rounds.xml
  def create
    @expense_for_round = ExpenseForRound.new(params[:expense_for_round])

    respond_to do |format|
      if @expense_for_round.save
        format.html { redirect_to(@expense_for_round, :notice => 'Expense for round was successfully created.') }
        format.xml  { render :xml => @expense_for_round, :status => :created, :location => @expense_for_round }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @expense_for_round.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /expense_for_rounds/1
  # PUT /expense_for_rounds/1.xml
  def update
    @expense_for_round = ExpenseForRound.find(params[:id])

    respond_to do |format|
      if @expense_for_round.update_attributes(params[:expense_for_round])
        format.html { redirect_to(@expense_for_round, :notice => 'Expense for round was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @expense_for_round.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /expense_for_rounds/1
  # DELETE /expense_for_rounds/1.xml
  def destroy
    @expense_for_round = ExpenseForRound.find(params[:id])
    @expense_for_round.destroy

    respond_to do |format|
      format.html { redirect_to(expense_for_rounds_url) }
      format.xml  { head :ok }
    end
  end
end
