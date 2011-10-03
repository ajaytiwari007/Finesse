class StudentGroupCaseStudiesController < ApplicationController
  # GET /student_group_case_studies
  # GET /student_group_case_studies.xml
  def index
    @student_group_case_studies = StudentGroupCaseStudy.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @student_group_case_studies }
    end
  end

  # GET /student_group_case_studies/1
  # GET /student_group_case_studies/1.xml
  def show
    @student_group_case_study = StudentGroupCaseStudy.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @student_group_case_study }
    end
  end

  # GET /student_group_case_studies/new
  # GET /student_group_case_studies/new.xml
  def new
    @student_group_case_study = StudentGroupCaseStudy.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @student_group_case_study }
    end
  end

  # GET /student_group_case_studies/1/edit
  def edit
    @student_group_case_study = StudentGroupCaseStudy.find(params[:id])
  end

  # POST /student_group_case_studies
  # POST /student_group_case_studies.xml
  def create
    @student_group_case_study = StudentGroupCaseStudy.new(params[:student_group_case_study])

    respond_to do |format|
      if @student_group_case_study.save
        format.html { redirect_to(@student_group_case_study, :notice => 'Student group case study was successfully created.') }
        format.xml  { render :xml => @student_group_case_study, :status => :created, :location => @student_group_case_study }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @student_group_case_study.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /student_group_case_studies/1
  # PUT /student_group_case_studies/1.xml
  def update
    @student_group_case_study = StudentGroupCaseStudy.find(params[:id])

    respond_to do |format|
      if @student_group_case_study.update_attributes(params[:student_group_case_study])
        format.html { redirect_to(@student_group_case_study, :notice => 'Student group case study was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @student_group_case_study.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /student_group_case_studies/1
  # DELETE /student_group_case_studies/1.xml
  def destroy
    @student_group_case_study = StudentGroupCaseStudy.find(params[:id])
    @student_group_case_study.destroy

    respond_to do |format|
      format.html { redirect_to(student_group_case_studies_url) }
      format.xml  { head :ok }
    end
  end
end
