class WikimapsController < ApplicationController
  require 'digest/md5'
  before_filter :login_or_oauth_required
  skip_before_filter :verify_authenticity_token

  def new
    @html_title = "New wikimaps map "
  end

  def create
    image_url = URI.escape("https:"+ params[:path])
    image_title = File.basename(image_url)

    if map = Map.find_by_unique_id(image_title)
      redirect_to map
      return
    end

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

