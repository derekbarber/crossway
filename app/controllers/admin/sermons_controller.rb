module Admin
  class SermonsController < ApplicationController
    before_filter :authorize

    # GET /sermons
    # GET /sermons.json
    def index
      @sermons = Sermon.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: SermonsDatatable.new(view_context) }
      end
    end

    # GET /sermons/new
    # GET /sermons/new.json
    def new
      @sermon = Sermon.new
      @sermon_series = SermonSeries.all.collect { |sermon_series| [sermon_series.title, sermon_series.id] }

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @sermon }
      end
    end

    # GET /sermons/1/edit
    def edit
      @sermon = Sermon.find(params[:id])
      @sermon_series = SermonSeries.all.collect { |sermon_series| [sermon_series.title, sermon_series.id] }
    end

    # POST /sermons
    # POST /sermons.json
    def create
      @sermon = Sermon.new(params[:sermon])
      
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

    # PUT /sermons/1
    # PUT /sermons/1.json
    def update
      @sermon = Sermon.find(params[:id])

      respond_to do |format|
        if @sermon.update_attributes(params[:sermon])
          format.html { redirect_to admin_sermons_url, notice: 'Sermon was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @sermon.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /sermons/1
    # DELETE /sermons/1.json
    def destroy
      @sermon = Sermon.find(params[:id])
      @sermon.destroy

      respond_to do |format|
        format.html { redirect_to admin_sermons_url }
        format.json { head :no_content }
      end
    end
  end
end