class WikimapsController < ApplicationController
  require 'digest/md5'
  before_filter :login_or_oauth_required
  skip_before_filter :verify_authenticity_token

  def new
    @html_title = "New wikimaps map " + params[:title]
  end

  def create
    image_title = params[:title]
    image_title.gsub!(" ", "_")

    if map = Map.find_by_unique_id(image_title)
      redirect_to map
      return
    end

    hash = Digest::MD5.hexdigest(image_title)
    image_url = "https://upload.wikimedia.org/wikipedia/commons/"+ hash[0...1] + "/"+ hash[0...2] + "/"+ image_title

    map = {
      :title => image_title,
      :unique_id => image_title,
      :public => true,
      :map_type => "is_map",
      :upload_url => image_url
    }

    @map = Map.new(map)

    if logged_in?
      @map.owner = current_user
      @map.users << current_user
    end

    respond_to do |format|
      if @map.save
        flash[:notice] = 'Map was successfully created.'
        format.html { redirect_to(@map) }
      else
        flash[:error] = "Map not created. Error message:<br />"+ @map.errors.to_a.join(" ")
        format.html{ redirect_to :action => "new" }
      end
    end


  end

end

