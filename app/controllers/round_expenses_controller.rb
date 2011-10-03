class RoundExpensesController < ApplicationController
  # GET /round_expenses
  # GET /round_expenses.xml
  def index
    @round_expenses = RoundExpense.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @round_expenses }
    end
  end

  # GET /round_expenses/1
  # GET /round_expenses/1.xml
  def show
    @round_expense = RoundExpense.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @round_expense }
    end
  end

  # GET /round_expenses/new
  # GET /round_expenses/new.xml
  def new
    @round_expense = RoundExpense.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @round_expense }
    end
  end

  # GET /round_expenses/1/edit
  def edit
    @round_expense = RoundExpense.find(params[:id])
  end

  # POST /round_expenses
  # POST /round_expenses.xml
  def create
    @round_expense = RoundExpense.new(params[:round_expense])
    @round=Round.new(params[:round])
    respond_to do |format|
      if @round_expense.save
        format.html { redirect_to(@round_expense, :notice => 'Round expense was successfully created.') }
        format.xml  { render :xml => @round_expense, :status => :created, :location => @round_expense }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @round_expense.errors, :status => :unprocessable_entity }
      end
    end
    @round.save
  end

  # PUT /round_expenses/1
  # PUT /round_expenses/1.xml
  def update
    @round_expense = RoundExpense.find(params[:id])

    respond_to do |format|
      if @round_expense.update_attributes(params[:round_expense])
        format.html { redirect_to(@round_expense, :notice => 'Round expense was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @round_expense.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /round_expenses/1
  # DELETE /round_expenses/1.xml
  def destroy
    @round_expense = RoundExpense.find(params[:id])
    @round_expense.destroy

    respond_to do |format|
      format.html { redirect_to(round_expenses_url) }
      format.xml  { head :ok }
    end
  end
end
