class NepaDocumentsController < ApplicationController

	layout 'nepa'

	before_filter :login_required, :except => [:index, :show]

	before_filter :check_administrator_role, :except => [:index, :show]



	helper :sort
	include SortHelper

#     sort_init 'last_name'
#     sort_update

	# GET /nepa_documents
	# GET /nepa_documents.xml
	def index

		sort_init('document_no', {:default_order => "desc"})

		@query = params[:query]
		@field = %w(document_no title comments).detect{|f| f == (params[:field])}
		@field = "document_no" if @field.nil?
		#we'll use POSIX regular expression for searches    ~*'( |^)robinson([^A-z]|$)' and to strip out brakets etc  ~*'(:punct:|^|)plate 6([^A-z]|$)';
		if @query && @query.strip.length > 0 && @field
			conditions = ["#{@field}  ~* ?", '(:punct:|^|)'+@query+'([^A-z]*|$)']
		else
			conditions = nil
		end

		#if params[:sort_order] && params[:sort_order] == "desc"
		#	sort_nulls = " NULLS LAST"
		#else
		#	sort_nulls = " NULLS FIRST"
		#end

		@per_page = params[:per_page] || 10

		paginate_params = {
			:page => params[:page],
			:per_page => @per_page,
			:order => sort_clause, #+ sort_nulls,
			:conditions => conditions
		}


		@nepa_documents =
			#NepaDocument.all
			#NepaDocument.all(:conditions => ["id < ?", 3500]) #debug
			NepaDocument.paginate(paginate_params);


		respond_to do |format|
			format.html # index.html.erb
			format.xml  { render :xml => @nepa_documents }
		end
	end

	# GET /nepa_documents/1
	# GET /nepa_documents/1.xml
	def show
	@nepa_document = NepaDocument.find(params[:id])
	#@nepa_document = NepaDocument.find(params[:map_id])
	# @nepa_document = NepaDocument.find(:map_id => 455)
	#@nepa_document = #NepaDocument.find(params[:map_id])
	#	NepaDocument.all(:conditions => {:map_id => params[:map_id]})

	#@ownedMap = Map.find(params[:map_id])

	respond_to do |format|
	format.html # show.html.erb
	format.xml  { render :xml => @nepa_document }
	end
	end


  # GET /nepa_documents/new
  # GET /nepa_documents/new.xml
  def new
    @nepa_document = NepaDocument.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @nepa_document }
    end
  end

  # GET /nepa_documents/1/edit
  def edit
    @nepa_document = NepaDocument.find(params[:id])
  end

  # POST /nepa_documents
  # POST /nepa_documents.xml
  def create
    @nepa_document = NepaDocument.new(params[:nepa_document])

    respond_to do |format|
      if @nepa_document.save
        flash[:notice] = 'NepaDocument was successfully created.'
        format.html { redirect_to(@nepa_document) }
        format.xml  { render :xml => @nepa_document, :status => :created, :location => @nepa_document }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @nepa_document.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /nepa_documents/1
  # PUT /nepa_documents/1.xml
  def update
    @nepa_document = NepaDocument.find(params[:id])

    respond_to do |format|
      if @nepa_document.update_attributes(params[:nepa_document])
        flash[:notice] = 'NepaDocument was successfully updated.'
        format.html { redirect_to(@nepa_document) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @nepa_document.errors, :status => :unprocessable_entity }
      end
    end
  end


def assign
	@new_map_id = params[:nepa_document_map_id]
	logger.debug "[BWE] nepadoc assign :" + @new_map_id.to_s
	@nepa_documents_to_clear = NepaDocument.all(:conditions => ["map_id = ?", @new_map_id])

	@nepa_documents_to_clear.each do |nd|
		nd.map_id = nil
		nd.save
	end

	#TODO: NEED TO clear links to map_id

	@nepa_document = NepaDocument.find(params[:nepa_document_id])


	@nepa_document.map_id = @new_map_id

	respond_to do |format|
		if @nepa_document.save
			flash[:notice] = 'Nepa Document was successfully updated with a new associated map.'
			format.html { redirect_to(nepa_documents_url) }
			format.xml  { head :ok }
		else
			format.html { render :action => "edit" }
			format.xml  { render :xml => @nepa_document.errors, :status => :unprocessable_entity }
		end
	end
end


  # DELETE /nepa_documents/1
  # DELETE /nepa_documents/1.xml
  def destroy
    @nepa_document = NepaDocument.find(params[:id])
    @nepa_document.destroy

    respond_to do |format|
      format.html { redirect_to(nepa_documents_url) }
      format.xml  { head :ok }
    end
  end
end
