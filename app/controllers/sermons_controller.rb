class SermonsController < ApplicationController
  # GET /sermons
  # GET /sermons.json
  def index
    @sermons = Sermon.order("date desc").all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sermons }
      format.atom { render :layout => false }
    end
  end

  # GET /sermons/1
  # GET /sermons/1.json
  def show
    @sermon = Sermon.find(params[:id])
    @sermon_series = SermonSeries.find(@sermon.sermon_series_id)
    @sermons = @sermon_series.sermons.order("date asc").all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sermon }
    end
  end
end
