class NepaLookupMilestonesController < ApplicationController

	layout 'application' #change to nepa


  # GET /nepa_lookup_milestones
  # GET /nepa_lookup_milestones.xml
  def index
    @nepa_lookup_milestones = NepaLookupMilestone.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @nepa_lookup_milestones }
    end
  end

  # GET /nepa_lookup_milestones/1
  # GET /nepa_lookup_milestones/1.xml
  def show
    @nepa_lookup_milestone = NepaLookupMilestone.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @nepa_lookup_milestone }
    end
  end

  # GET /nepa_lookup_milestones/new
  # GET /nepa_lookup_milestones/new.xml
  def new
    @nepa_lookup_milestone = NepaLookupMilestone.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @nepa_lookup_milestone }
    end
  end

  # GET /nepa_lookup_milestones/1/edit
  def edit
    @nepa_lookup_milestone = NepaLookupMilestone.find(params[:id])
  end

  # POST /nepa_lookup_milestones
  # POST /nepa_lookup_milestones.xml
  def create
    @nepa_lookup_milestone = NepaLookupMilestone.new(params[:nepa_lookup_milestone])

    respond_to do |format|
      if @nepa_lookup_milestone.save
        flash[:notice] = 'NepaLookupMilestone was successfully created.'
        format.html { redirect_to(@nepa_lookup_milestone) }
        format.xml  { render :xml => @nepa_lookup_milestone, :status => :created, :location => @nepa_lookup_milestone }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @nepa_lookup_milestone.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /nepa_lookup_milestones/1
  # PUT /nepa_lookup_milestones/1.xml
  def update
    @nepa_lookup_milestone = NepaLookupMilestone.find(params[:id])

    respond_to do |format|
      if @nepa_lookup_milestone.update_attributes(params[:nepa_lookup_milestone])
        flash[:notice] = 'NepaLookupMilestone was successfully updated.'
        format.html { redirect_to(@nepa_lookup_milestone) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @nepa_lookup_milestone.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /nepa_lookup_milestones/1
  # DELETE /nepa_lookup_milestones/1.xml
  def destroy
    @nepa_lookup_milestone = NepaLookupMilestone.find(params[:id])
    @nepa_lookup_milestone.destroy

    respond_to do |format|
      format.html { redirect_to(nepa_lookup_milestones_url) }
      format.xml  { head :ok }
    end
  end
end
