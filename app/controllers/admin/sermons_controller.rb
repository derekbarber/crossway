module Admin
  class SermonsController < ApplicationController
    before_filter :authorize

    def index
      @sermons = Sermon.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: SermonsDatatable.new(view_context) }
      end
    end

    def new
      @sermon = Sermon.new
      @sermon_series = SermonSeries.all.collect { |sermon_series| [sermon_series.title, sermon_series.id] }

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @sermon }
      end
    end

    def edit
      @sermon = Sermon.find(params[:id])
      @sermon_series = SermonSeries.all.collect { |sermon_series| [sermon_series.title, sermon_series.id] }
    end

    def create
      @sermon = Sermon.new(sermon_params)
      
      respond_to do |format|
        if @sermon.save
          format.html { redirect_to admin_sermons_url, notice: 'Sermon was successfully created.' }
          format.json { render json: @sermon, status: :created, location: @sermon }
        else
          format.html { render action: "new" }
          format.json { render json: @sermon.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      @sermon = Sermon.find(params[:id])

      respond_to do |format|
        if @sermon.update_attributes(sermon_params)
          format.html { redirect_to admin_sermons_url, notice: 'Sermon was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @sermon.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @sermon = Sermon.find(params[:id])
      @sermon.destroy

      respond_to do |format|
        format.html { redirect_to admin_sermons_url }
        format.json { head :no_content }
      end
    end

  private

    def sermon_params
      params.require(:sermon).permit(:audio_file, :date, :description, :scripture_reference, :sermon_series_id, 
        :speaker, :title, :video_embed, :audio_file_duration)
    end
  end
end