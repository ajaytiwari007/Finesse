class StudentGroupUsersController < ApplicationController
  # GET /student_group_users
  # GET /student_group_users.xml
  def index
    if(params[:student_group_id].nil?)
    @student_group_users = StudentGroupUser.all
    else
    @student_group=StudentGroup.find(params[:student_group_id])
    @student_group_users=@student_group.student_group_users
     end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @student_group_users }
    end
  end

  # GET /student_group_users/1
  # GET /student_group_users/1.xml
  def show
    @student_group_user = StudentGroupUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @student_group_user }
    end
  end

  # GET /student_group_users/new
  # GET /student_group_users/new.xml
  def new
    @student_group_user = StudentGroupUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @student_group_user }
    end
  end

  # GET /student_group_users/1/edit
  def edit
    @student_group_user = StudentGroupUser.find(params[:id])
  end

  # POST /student_group_users
  # POST /student_group_users.xml
  def create
    @student_group_user = StudentGroupUser.new(params[:student_group_user])

    respond_to do |format|
      if @student_group_user.save
        format.html { redirect_to(@student_group_user, :notice => 'Student group user was successfully created.') }
        format.xml  { render :xml => @student_group_user, :status => :created, :location => @student_group_user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @student_group_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /student_group_users/1
  # PUT /student_group_users/1.xml
  def update
    @student_group_user = StudentGroupUser.find(params[:id])

    respond_to do |format|
      if @student_group_user.update_attributes(params[:student_group_user])
        format.html { redirect_to(@student_group_user, :notice => 'Student group user was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @student_group_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /student_group_users/1
  # DELETE /student_group_users/1.xml
  def destroy
    @student_group_user = StudentGroupUser.find(params[:id])
    @student_group_user.destroy

    respond_to do |format|
      format.html { redirect_to(student_group_users_url) }
      format.xml  { head :ok }
    end
  end
end
