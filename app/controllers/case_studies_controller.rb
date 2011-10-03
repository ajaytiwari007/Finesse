class CaseStudiesController < ApplicationController
  # GET /case_studies
  # GET /case_studies.xml
  def index
    @case_studies = CaseStudy.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @case_studies }
    end
  end

  # GET /case_studies/1
  # GET /case_studies/1.xml
  def show
    @case_study = CaseStudy.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @case_study }
    end
  end

  # GET /case_studies/new
  # GET /case_studies/new.xml
  def new
    @case_study = CaseStudy.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @case_study }
    end
  end

  # GET /case_studies/1/edit
  def edit
    @case_study = CaseStudy.find(params[:id])
  end

  # POST /case_studies
  # POST /case_studies.xml
  def create
    @case_study = CaseStudy.new(params[:case_study])
    #redirect_to(:controller => :rounds,:action=>'new', :case_study_id=>@case_study.id)
    #respond_to do |format|
      if @case_study.save
        redirect_to new_round_path(:case_study_id=>@case_study.id, :round_create_counter=>0)
        #format.html { redirect_to(@case_study, :notice => 'Case study was successfully created.') }
        #format.xml  { render :xml => @case_study, :status => :created, :location => @case_study }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @case_study.errors, :status => :unprocessable_entity }
      end
    #end
  end

  # PUT /case_studies/1
  # PUT /case_studies/1.xml
  def update
    @case_study = CaseStudy.find(params[:id])

    respond_to do |format|
      if @case_study.update_attributes(params[:case_study])
        format.html { redirect_to(@case_study, :notice => 'Case study was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @case_study.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /case_studies/1
  # DELETE /case_studies/1.xml
  def destroy
    @case_study = CaseStudy.find(params[:id])
    @case_study.destroy

    respond_to do |format|
      format.html { redirect_to(case_studies_url) }
      format.xml  { head :ok }
    end
  end
end
