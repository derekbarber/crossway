class SermonSeriesController < ApplicationController

  # GET /sermon_series
  # GET /sermon_series.json
  def index
    @sermon_series = SermonSeries.order("start_date desc").where(:current_series => false)

    @current_sermon_series = SermonSeries.where(:current_series => true).first

    @latest_sermon = Sermon.order("date desc").first

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sermon_series }
    end
  end

  # GET /sermon_series/1
  # GET /sermon_series/1.json
  def show
    @sermon_series = SermonSeries.find(params[:id])
    @sermons = @sermon_series.sermons.order("date asc").all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sermon_series }
    end
  end
end
