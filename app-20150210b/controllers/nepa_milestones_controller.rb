class NepaMilestonesController < ApplicationController

	layout 'nepa'

	#TODO: VALIDATIONS
	
	# GET /nepa_document/:nepa_document_id/nepa_milestones
	# GET /nepa_document/:nepa_document_id/nepa_milestones.xml
	def index
		@show_nepa_document_link = true
		@nepa_document = NepaDocument.find(params[:nepa_document_id])
		@nepa_milestones = NepaMilestone.all(:conditions => {:nepa_document_id => params[:nepa_document_id]})

		#@nepa_lookup_milestones = NepaLookupMilestone.all()

		respond_to do |format|
			format.html # index.html.erb
			format.xml  { render :xml => @nepa_milestones }
		end
	end


	# GET /nepa_document/:nepa_document_id/nepa_milestones/1
	# GET /nepa_document/:nepa_document_id/nepa_milestones/1.xml
	def show
		@show_nepa_document_link = true
		@nepa_document = NepaDocument.find(params[:nepa_document_id])
		@nepa_milestone = NepaMilestone.find(params[:id])

		respond_to do |format|
			format.html # show.html.erb
			format.xml  { render :xml => @nepa_milestone }
		end
	end


	# GET /nepa_document/:nepa_document_id/nepa_milestones/new
	# GET /nepa_document/:nepa_document_id/nepa_milestones/new.xml
	def new
		@show_nepa_document_link = true
		@nepa_document = NepaDocument.find(params[:nepa_document_id])
		@nepa_milestone = NepaMilestone.new
		#@nepa_milestone.nepa_document_id = params[:nepa_document_id]

		respond_to do |format|
			format.html # new.html.erb
			format.xml  { render :xml => @nepa_milestone }
		end
	end

	# GET /nepa_document/:nepa_document_id/nepa_milestones/1/edit
	def edit
		@show_nepa_document_link = true
		@nepa_document = NepaDocument.find(params[:nepa_document_id])
		@nepa_milestone = NepaMilestone.find(params[:id])

		nlmid = @nepa_milestone.nepa_lookup_milestone.id
	end

	# POST /nepa_document/:nepa_document_id/nepa_milestones
	# POST /nepa_document/:nepa_document_id/nepa_milestones.xml
	def create
		@show_nepa_document_link = true
		@nepa_document = NepaDocument.find(params[:nepa_document_id])
		@nepa_milestone = NepaMilestone.new(params[:nepa_milestone])
		@nepa_milestone.nepa_document_id = params[:nepa_document_id]

#logger.debug "[ BWE DEBUG ][ BWE DEBUG ][ BWE DEBUG ][ BWE DEBUG ][ BWE DEBUG ] CREATE NEPA MILESTONE"

		respond_to do |format|
			if @nepa_milestone.save
				flash[:notice] = 'NepaMilestone was successfully created.'
				#format.html { redirect_to(@nepa_milestone) }
				format.html { redirect_to(nepa_document_nepa_milestones_url) }
				format.xml  { render :xml => @nepa_milestone, :status => :created, :location => @nepa_milestone }
			else
				format.html { render :action => "new" }
				format.xml  { render :xml => @nepa_milestone.errors, :status => :unprocessable_entity }
			end
		end
	end

	# PUT /nepa_document/:nepa_document_id/nepa_milestones/1
	# PUT /nepa_document/:nepa_document_id/nepa_milestones/1.xml
	def update
		@nepa_milestone = NepaMilestone.find(params[:id])

		respond_to do |format|
			if @nepa_milestone.update_attributes(params[:nepa_milestone])
				flash[:notice] = 'NepaMilestone was successfully updated.'
				format.html { redirect_to(nepa_document_nepa_milestone_path) }
				format.xml  { head :ok }
			else
				format.html { render :action => "edit" }
				format.xml  { render :xml => @nepa_milestone.errors, :status => :unprocessable_entity }
			end
		end
	end

	# DELETE /nepa_document/:nepa_document_id/nepa_milestones/1
	# DELETE /nepa_document/:nepa_document_id/nepa_milestones/1.xml
	def destroy
		@nepa_milestone = NepaMilestone.find(params[:id])
		@nepa_milestone.destroy

#logger.debug "[ BWE DEBUG ][ BWE DEBUG ][ BWE DEBUG ][ BWE DEBUG ][ BWE DEBUG ] DESTROY NEPA MILESTONE"

		respond_to do |format|
			format.html { redirect_to(nepa_document_nepa_milestones_url) }
			format.xml  { head :ok }
		end
	end
end
