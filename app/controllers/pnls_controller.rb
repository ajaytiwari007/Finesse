class PnlsController < ApplicationController
  # GET /pnls
  # GET /pnls.xml
  def index


    @pnls = Pnl.all


    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pnls }
    end
  end

  # GET /pnls/1
  # GET /pnls/1.xml
  def show
    @pnl = Pnl.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pnl }
    end
  end

  # GET /pnls/new
  # GET /pnls/new.xml

  def manual_new
     @player=Player.find(params[:player_id])
     @round=Round.find(params[:round_id])
      @pnl = Pnl.new
     @pnl.round_id=@round.id
     @pnl.player_id=@player.id
     @pnl.interest=10000
    @pnl.inv_income=100000
    @pnl.depreciation=5000
    @pnl.tax=15000
     @pnl.save
      cogs=0
        income=0
        sga=0
        employee_cost=0
        @player_factories=PlayerFactory.find_all_by_player_id(@pnl.player_id)
        @player_factories.each do |player_factor|
        @employee_types=EmployeeType.all
        @employee_types.each do |employee_type|
         xcount=Employee.count(:all,:conditions => ['factory_id=? and employee_type_id=?',player_factor.factory_id,employee_type.id])
         employee_cost+=(xcount*EmployeeType.find(employee_type.id).cost)
        end
        end
        @brands=Brand.find_all_by_player_id(@pnl.player_id)
        @brands.each do |brand|
          @selected_media=SelectedMedium.find(:all,:conditions => ['round_id=? and brand_id=?',@round.id,brand.id])
          @selected_media.each do |medium|
            sga+=medium.advertising_cost
          end
          @channel_incentive_for_rounds=ChannelIncentiveForRound.find_all_by_round_id(@pnl.round_id)
          @channel_incentive_for_rounds.each do |cifr|
            @selected_channel_incentives=SelectedChannelIncentive.find(:all,:conditions => ['channel_incentive_for_round_id=? and brand_id=?',cifr.id,brand.id])
              @selected_channel_incentives.each do |channel_incentive|
                sga+=channel_incentive.channel_incentive_cost
              end
            end
        end

        @productions=Production.find(:all, :conditions => ['player_id=? and round_id=?', @player.id,@round.id])
        @productions.each do |production|
          income+=production.quantity*Brand.find_by_product_type_id(Factory.find(production.factory_id).product_type_id).price
          cogs+=production.production_cost

          @pnl.ebitda=(income-(cogs+employee_cost+sga))
          @pnl.pbt=((income-cogs-employee_cost-sga)-@pnl.interest+@pnl.inv_income-@pnl.depreciation)
          @pnl.pat= (((income-cogs-employee_cost-sga)-@pnl.interest+@pnl.inv_income-@pnl.depreciation)-@pnl.tax)
          @pnl.cogs=cogs
          @pnl.sga=sga
          @pnl.income=income
          @pnl.employee_cost=employee_cost
          @pnl.save

        end
        @pnl1=Pnl.find_last_by_player_id(@pnl.player_id)
         redirect_to(:controller => :pnls, :action => "index",:player_id=>@player.id,:round_id=>@round.id)
    #redirect_to :action => "create",:pnl_id=>@pnl.id
  end


  def new
    @player=Player.find(params[:player_id])

    @pnl = Pnl.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pnl }
    end
  end

  # GET /pnls/1/edit
  def edit
    @pnl = Pnl.find(params[:id])
  end

  # POST /pnls
  # POST /pnls.xml
  def create
    if params[:pnl_id]!=nil
      @pnl=Pnl.find(params[:pnl_id])
    else
      @pnl = Pnl.new(params[:pnl])
    end
    respond_to do |format|
      if @pnl.save
        @pnl=Pnl.last
        cogs=0
        income=0
        sga=0
        employee_cost=0
        @player_factories=PlayerFactory.find_all_by_player_id(@pnl.player_id)
        @player_factories.each do |player_factor|
        @employee_types=EmployeeType.all
        @employee_types.each do |employee_type|
         xcount=Employee.count(:all,:conditions => ['factory_id=? and employee_type_id=?',player_factor.factory_id,employee_type.id])
         employee_cost+=(xcount*EmployeeType.find(employee_type.id).cost)
        end
        end
        @brands=Brand.find_all_by_player_id(@pnl.player_id)
        @brands.each do |brand|
          @selected_media=SelectedMedium.find(:all,:conditions => ['round_id=? and brand_id=?',@pnl.round_id,brand.id])
          @selected_media.each do |medium|
            sga+=medium.advertising_cost
          end
          @channel_incentive_for_rounds=ChannelIncentiveForRound.find_all_by_round_id(@pnl.round_id)
          @channel_incentive_for_rounds.each do |cifr|
            @selected_channel_incentives=SelectedChannelIncentive.find(:all,:conditions => ['channel_incentive_for_round_id=? and brand_id=?',cifr.id,brand.id])
              @selected_channel_incentives.each do |channel_incentive|
                sga+=channel_incentive.channel_incentive_cost
              end
            end
        end

        @productions=Production.find(:all, :conditions => ['player_id=? and round_id=?', @pnl.player_id,@pnl.round_id])
        @productions.each do |production|
          income+=production.quantity*Brand.find_by_product_type_id(Factory.find(production.factory_id).product_type_id).price
          cogs+=production.production_cost

          @pnl.ebitda=(income-(cogs+employee_cost+sga))
          @pnl.pbt=((income-cogs-employee_cost-sga)-@pnl.interest+@pnl.inv_income-@pnl.depreciation)
          @pnl.pat= (((income-cogs-employee_cost-sga)-@pnl.interest+@pnl.inv_income-@pnl.depreciation)-@pnl.tax)
          @pnl.cogs=cogs
          @pnl.sga=sga
          @pnl.income=income
          @pnl.employee_cost=employee_cost
          @pnl.save

        end
        @pnl1=Pnl.find_last_by_player_id(@pnl.player_id)
        format.html { redirect_to(:controller => :pnls, :action => "index",:player_id=>@pnl.player_id,:round_id=>@pnl.round_id, :notice => 'Pnl was successfully created.') }
        format.xml { render :xml => @pnl, :status => :created, :location => @pnl }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @pnl.errors, :status => :unprocessable_entity }
      end
  end
  end

  # PUT /pnls/1
  # PUT /pnls/1.xml
  def update
    @pnl = Pnl.find(params[:id])

    respond_to do |format|
      if @pnl.update_attributes(params[:pnl])
        format.html { redirect_to(@pnl, :notice => 'Pnl was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pnl.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pnls/1
  # DELETE /pnls/1.xml
  def destroy
    @pnl = Pnl.find(params[:id])
    @pnl.destroy

    respond_to do |format|
      format.html { redirect_to(pnls_url) }
      format.xml  { head :ok }
    end
  end
end
