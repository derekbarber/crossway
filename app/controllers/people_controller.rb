class PeopleController < ApplicationController

  # GET /people
  # GET /people.json
  def index

    @staff = Person.staff
    @lay_elders = Person.lay_elders

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sermon_series }
    end
  end

  # GET /people/1
  # GET /people/1.json
  def show
    if (params[:id])
      @person = Person.find(params[:id])
    end
    
    @staff = Person.staff
    @lay_elders = Person.lay_elders

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sermon_series }
    end
  end

  def staff
    @staff = Person.staff

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sermon_series }
    end
  end

  def lay_elders
    @lay_elders = Person.lay_elders

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sermon_series }
    end
  end
end
