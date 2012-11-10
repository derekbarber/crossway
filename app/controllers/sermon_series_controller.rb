class SermonSeriesController < ApplicationController
  # GET /sermon_series
  # GET /sermon_series.json
  def index
    @sermon_series = SermonSeries.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sermon_series }
    end
  end

  # GET /sermon_series/1
  # GET /sermon_series/1.json
  def show
    @sermon_series = SermonSeries.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sermon_series }
    end
  end

  # GET /sermon_series/new
  # GET /sermon_series/new.json
  def new
    @sermon_series = SermonSeries.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sermon_series }
    end
  end

  # GET /sermon_series/1/edit
  def edit
    @sermon_series = SermonSeries.find(params[:id])
  end

  # POST /sermon_series
  # POST /sermon_series.json
  def create
    @sermon_series = SermonSeries.new(params[:sermon_series])

    respond_to do |format|
      if @sermon_series.save
        format.html { redirect_to @sermon_series, notice: 'Sermon series was successfully created.' }
        format.json { render json: @sermon_series, status: :created, location: @sermon_series }
      else
        format.html { render action: "new" }
        format.json { render json: @sermon_series.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sermon_series/1
  # PUT /sermon_series/1.json
  def update
    @sermon_series = SermonSeries.find(params[:id])

    respond_to do |format|
      if @sermon_series.update_attributes(params[:sermon_series])
        format.html { redirect_to @sermon_series, notice: 'Sermon series was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sermon_series.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sermon_series/1
  # DELETE /sermon_series/1.json
  def destroy
    @sermon_series = SermonSeries.find(params[:id])
    @sermon_series.destroy

    respond_to do |format|
      format.html { redirect_to sermon_series_index_url }
      format.json { head :no_content }
    end
  end
end
