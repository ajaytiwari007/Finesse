class StudentGroupSurveysController < ApplicationController
  # GET /student_group_surveys
  # GET /student_group_surveys.xml
  def index
    @student_group_surveys = StudentGroupSurvey.all
    @student_group_survey=StudentGroupSurvey.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @student_group_surveys }
    end
  end

  # GET /student_group_surveys/1
  # GET /student_group_surveys/1.xml
  def show
    @student_group_survey = StudentGroupSurvey.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @student_group_survey }
    end
  end

  # GET /student_group_surveys/new
  # GET /student_group_surveys/new.xml
  def new
    @student_group_survey = StudentGroupSurvey.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @student_group_survey }
    end
  end

  # GET /student_group_surveys/1/edit
  def edit
    @student_group_survey = StudentGroupSurvey.find(params[:id])
  end

  # POST /student_group_surveys
  # POST /student_group_surveys.xml
  def create
    @student_group_survey = StudentGroupSurvey.new(params[:student_group_survey])

    respond_to do |format|
      if @student_group_survey.save
        format.html { redirect_to(:controller => :student_group_surveys,:action => "index", :notice => 'Student group survey was successfully created.') }
        format.xml  { render :xml => @student_group_survey, :status => :created, :location => @student_group_survey }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @student_group_survey.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /student_group_surveys/1
  # PUT /student_group_surveys/1.xml
  def update
    @student_group_survey = StudentGroupSurvey.find(params[:id])

    respond_to do |format|
      if @student_group_survey.update_attributes(params[:student_group_survey])
        format.html { redirect_to(@student_group_survey, :notice => 'Student group survey was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @student_group_survey.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /student_group_surveys/1
  # DELETE /student_group_surveys/1.xml
  def destroy
    @student_group_survey = StudentGroupSurvey.find(params[:id])
    @student_group_survey.destroy

    respond_to do |format|
      format.html { redirect_to(student_group_surveys_url) }
      format.xml  { head :ok }
    end
  end
end
