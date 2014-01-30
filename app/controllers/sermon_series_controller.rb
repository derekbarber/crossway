class SermonSeriesController < ApplicationController

  def index
    @sermon_series = SermonSeries.order("start_date desc")

    #@current_sermon_series = SermonSeries.where(:current_series => true).first

    @latest_sermon = Sermon.order("date desc").first

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sermon_series }
    end
  end

  def show
    @sermon_series = SermonSeries.find(params[:id])
    @sermons = @sermon_series.sermons.order("date asc").all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sermon_series }
    end
  end
end
