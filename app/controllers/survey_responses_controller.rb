class SurveyResponsesController < ApplicationController
  # GET /survey_responses
  # GET /survey_responses.xml
  def index
    @survey_responses = SurveyResponse.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @survey_responses }
    end
  end

  # GET /survey_responses/1
  # GET /survey_responses/1.xml
  def show
    @survey_response = SurveyResponse.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @survey_response }
    end
  end

  # GET /survey_responses/new
  # GET /survey_responses/new.xml
  def new
    @survey_response = SurveyResponse.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @survey_response }
    end
  end

  # GET /survey_responses/1/edit
  def edit
    @survey_response = SurveyResponse.find(params[:id])
  end

  # POST /survey_responses
  # POST /survey_responses.xml
  def create
    @survey_response = SurveyResponse.new(params[:survey_response])

    respond_to do |format|
      if @survey_response.save
        format.html { redirect_to(@survey_response, :notice => 'Survey response was successfully created.') }
        format.xml  { render :xml => @survey_response, :status => :created, :location => @survey_response }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @survey_response.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /survey_responses/1
  # PUT /survey_responses/1.xml
  def update
    @survey_response = SurveyResponse.find(params[:id])

    respond_to do |format|
      if @survey_response.update_attributes(params[:survey_response])
        format.html { redirect_to(@survey_response, :notice => 'Survey response was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @survey_response.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /survey_responses/1
  # DELETE /survey_responses/1.xml
  def destroy
    @survey_response = SurveyResponse.find(params[:id])
    @survey_response.destroy

    respond_to do |format|
      format.html { redirect_to(survey_responses_url) }
      format.xml  { head :ok }
    end
  end
end
