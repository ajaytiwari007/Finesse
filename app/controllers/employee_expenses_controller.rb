class EmployeeExpensesController < ApplicationController
  # GET /employee_expenses
  # GET /employee_expenses.xml
  def index
    @employee_expenses = EmployeeExpense.all
    @employee_expense=EmployeeExpense.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @employee_expenses }
    end
  end

  # GET /employee_expenses/1
  # GET /employee_expenses/1.xml
  def show
    @employee_expense = EmployeeExpense.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @employee_expense }
    end
  end

  # GET /employee_expenses/new
  # GET /employee_expenses/new.xml
  def new
    @employee_expense = EmployeeExpense.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @employee_expense }
    end
  end

  # GET /employee_expenses/1/edit
  def edit
    @employee_expense = EmployeeExpense.find(params[:id])
  end

  # POST /employee_expenses
  # POST /employee_expenses.xml
  def create
    @employee_expense = EmployeeExpense.new(params[:employee_expense])

    respond_to do |format|
      if @employee_expense.save
        format.html { redirect_to(:controller => :employee_expenses,:action => "index", :notice => 'Employee expense was successfully created.') }
        format.xml  { render :xml => @employee_expense, :status => :created, :location => @employee_expense }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @employee_expense.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /employee_expenses/1
  # PUT /employee_expenses/1.xml
  def update
    @employee_expense = EmployeeExpense.find(params[:id])

    respond_to do |format|
      if @employee_expense.update_attributes(params[:employee_expense])
        format.html { redirect_to(@employee_expense, :notice => 'Employee expense was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @employee_expense.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_expenses/1
  # DELETE /employee_expenses/1.xml
  def destroy
    @employee_expense = EmployeeExpense.find(params[:id])
    @employee_expense.destroy

    respond_to do |format|
      format.html { redirect_to(employee_expenses_url) }
      format.xml  { head :ok }
    end
  end
end
