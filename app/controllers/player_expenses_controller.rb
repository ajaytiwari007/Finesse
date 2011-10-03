class PlayerExpensesController < ApplicationController
  # GET /player_expenses
  # GET /player_expenses.xml
  def index
    @player_expenses = PlayerExpense.all
    @player_expense=PlayerExpense.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @player_expenses }
    end
  end

  # GET /player_expenses/1
  # GET /player_expenses/1.xml
  def show
    @player_expense = PlayerExpense.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @player_expense }
    end
  end

  # GET /player_expenses/new
  # GET /player_expenses/new.xml
  def new
    @player_expense = PlayerExpense.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @player_expense }
    end
  end

  # GET /player_expenses/1/edit
  def edit
    @player_expense = PlayerExpense.find(params[:id])
  end

  # POST /player_expenses
  # POST /player_expenses.xml
  def create
    @player_expense = PlayerExpense.new(params[:player_expense])

    respond_to do |format|
      if @player_expense.save
        format.html { redirect_to(:controller => :player_expenses,:action => "index", :notice => 'Player expense was successfully created.') }
        format.xml  { render :xml => @player_expense, :status => :created, :location => @player_expense }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @player_expense.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /player_expenses/1
  # PUT /player_expenses/1.xml
  def update
    @player_expense = PlayerExpense.find(params[:id])

    respond_to do |format|
      if @player_expense.update_attributes(params[:player_expense])
        format.html { redirect_to(@player_expense, :notice => 'Player expense was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @player_expense.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /player_expenses/1
  # DELETE /player_expenses/1.xml
  def destroy
    @player_expense = PlayerExpense.find(params[:id])
    @player_expense.destroy

    respond_to do |format|
      format.html { redirect_to(player_expenses_url) }
      format.xml  { head :ok }
    end
  end
end
