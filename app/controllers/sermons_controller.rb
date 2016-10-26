class SermonsController < ApplicationController

  def index
    @sermons = Sermon.order("date desc").all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sermons }
      format.rss { render :layout => false }
      format.atom { redirect_to feed_path(:format => :rss), :status => :moved_permanently }
    end
  end

  def show
    @sermon = Sermon.friendly.find(params[:id])
    @sermon_series = SermonSeries.find(@sermon.sermon_series_id)
    @sermons = @sermon_series.sermons.order("date asc").all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sermon }
    end
  end
end
