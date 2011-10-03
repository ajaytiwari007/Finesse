class SurveyPositionsController < ApplicationController
  # GET /survey_positions
  # GET /survey_positions.xml
  def index
    @survey_positions = SurveyPosition.all
    @survey_position=SurveyPosition.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @survey_positions }
    end
  end

  # GET /survey_positions/1
  # GET /survey_positions/1.xml
  def show
    @survey_position = SurveyPosition.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @survey_position }
    end
  end

  # GET /survey_positions/new
  # GET /survey_positions/new.xml
  def new
    @survey_position = SurveyPosition.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @survey_position }
    end
  end

  # GET /survey_positions/1/edit
  def edit
    @survey_position = SurveyPosition.find(params[:id])
  end

  # POST /survey_positions
  # POST /survey_positions.xml
  def create
    @survey_position = SurveyPosition.new(params[:survey_position])

    respond_to do |format|
      if @survey_position.save
        format.html { redirect_to(:controller => :survey_positions,:action => "index", :notice => 'Survey position was successfully created.') }
        format.xml  { render :xml => @survey_position, :status => :created, :location => @survey_position }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @survey_position.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /survey_positions/1
  # PUT /survey_positions/1.xml
  def update
    @survey_position = SurveyPosition.find(params[:id])

    respond_to do |format|
      if @survey_position.update_attributes(params[:survey_position])
        format.html { redirect_to(@survey_position, :notice => 'Survey position was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @survey_position.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /survey_positions/1
  # DELETE /survey_positions/1.xml
  def destroy
    @survey_position = SurveyPosition.find(params[:id])
    @survey_position.destroy

    respond_to do |format|
      format.html { redirect_to(survey_positions_url) }
      format.xml  { head :ok }
    end
  end
end
