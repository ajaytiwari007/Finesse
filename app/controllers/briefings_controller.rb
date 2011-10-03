class BriefingsController < ApplicationController
  # GET /briefings
  # GET /briefings.xml
  def index
    @briefings = Briefing.all
    @briefing=Briefing.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @briefings }
    end
  end

  # GET /briefings/1
  # GET /briefings/1.xml
  def show
    @briefing = Briefing.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @briefing }
    end
  end

  # GET /briefings/new
  # GET /briefings/new.xml
  def new
    @briefing = Briefing.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @briefing }
    end
  end

  # GET /briefings/1/edit
  def edit
    @briefing = Briefing.find(params[:id])
  end

  # POST /briefings
  # POST /briefings.xml
  def create
    @briefing = Briefing.new(params[:briefing])

    respond_to do |format|
      if @briefing.save
        format.html { redirect_to(:controller => :briefings,:action => "index", :notice => 'Briefing was successfully created.') }
        format.xml  { render :xml => @briefing, :status => :created, :location => @briefing }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @briefing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /briefings/1
  # PUT /briefings/1.xml
  def update
    @briefing = Briefing.find(params[:id])

    respond_to do |format|
      if @briefing.update_attributes(params[:briefing])
        format.html { redirect_to(@briefing, :notice => 'Briefing was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @briefing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /briefings/1
  # DELETE /briefings/1.xml
  def destroy
    @briefing = Briefing.find(params[:id])
    @briefing.destroy

    respond_to do |format|
      format.html { redirect_to(briefings_url) }
      format.xml  { head :ok }
    end
  end
end
