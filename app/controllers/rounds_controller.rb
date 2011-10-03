class RoundsController < ApplicationController
  # GET /rounds
  # GET /rounds.xml


  def index
    @rounds = Round.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @rounds }
    end
  end

  # GET /rounds/1
  # GET /rounds/1.xml
  def show
    @round = Round.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @round }
    end
  end

  # GET /rounds/new
  # GET /rounds/new.xml
  def new

    @counter=params[:round_create_counter].to_i
    @counter+=1

    @case_study=CaseStudy.find(params[:case_study_id])
    @round=Round.new
    #@round.case_study_id=@case_study.id
    @departments=Department.all
    @macro_indicators=MacroIndicator.all
    @expenses=Expense.all(:order=>'department_id ASC')
    @macro_indicator_options=MacroIndicatorOption.all(:order => 'macro_indicator_id ASC')
    @round.macro_indicator_for_rounds.build
    @round.round_expenses.build
    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @round }
    end
  end

  # GET /rounds/1/edit
  def edit
    @round = Round.find(params[:id])
  end

  # POST /rounds
  # POST /rounds.xml
  def create
    @round = Round.new(params[:round])
    @counter=params[:round_create_counter].to_i
    respond_to do |format|
      if @round.save
        format.html { redirect_to(:action => 'new', :case_study_id=>@round.case_study_id, :round_create_counter=>@counter) }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @round.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rounds/1
  # PUT /rounds/1.xml
  def update
    @round = Round.find(params[:id])

    respond_to do |format|
      if @round.update_attributes(params[:round])
        format.html { redirect_to(@round, :notice => 'Round was successfully updated.') }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @round.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rounds/1
  # DELETE /rounds/1.xml
  def destroy
    @round = Round.find(params[:id])
    @round.destroy

    respond_to do |format|
      format.html { redirect_to(rounds_url) }
      format.xml { head :ok }
    end
  end
end
