module Admin
  class SermonSeriesController < ApplicationController
    before_filter :authorize

    def index
      @sermon_series = SermonSeries.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @sermon_series }
      end
    end

    def new
      @sermon_series = SermonSeries.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @sermon_series }
      end
    end

    def edit
      @sermon_series = SermonSeries.find(params[:id])
    end

    def create
      @sermon_series = SermonSeries.new(sermon_series_params)

      respond_to do |format|
        if @sermon_series.save
          format.html { redirect_to admin_sermon_series_index_path, notice: 'Sermon series was successfully created.' }
          format.json { render json: @sermon_series, status: :created, location: @sermon_series }
        else
          format.html { render action: "new" }
          format.json { render json: @sermon_series.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      @sermon_series = SermonSeries.find(params[:id])

      respond_to do |format|
        if @sermon_series.update_attributes(sermon_series_params)
          format.html { redirect_to admin_sermon_series_index_path, notice: 'Sermon series was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @sermon_series.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @sermon_series = SermonSeries.find(params[:id])
      @sermon_series.destroy

      respond_to do |format|
        format.html { redirect_to admin_sermon_series_index_path }
        format.json { head :no_content }
      end
    end

  private

    def sermon_series_params
      params.require(:sermon_series).permit(:banner_image, :button_image, :current_series, :description, 
        :end_date, :start_date, :title, :banner_image_url, :button_image_url)
    end
  end
end
