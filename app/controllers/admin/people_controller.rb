module Admin
  class PeopleController < ApplicationController
    before_action :load_person, only: [:edit, :update, :destroy]
    before_filter :authorize

    def index
      @people = Person.all
    end

    def new
      @person = Person.new
    end

    def edit
    end

    def create
      @person = Person.new(person_params)
      if @person.save
        redirect_to admin_people_path, notice: 'Person was successfully created.'
      else
        render action: "new"
      end
    end

    def update
      if @person.update_attributes(person_params)
        redirect_to admin_people_path, notice: 'Person was successfully updated.'
      else
        render action: "edit"
      end
    end

    def destroy
      @person.destroy
      redirect_to admin_people_url, notice: "Person was successfully destroyed."
    end
    
  private

    def load_person
      @person = Person.find(params[:id])
    end

    def person_params
      params.require(:person).permit(:content, :image, :name, :title, :role, :enabled, :display_order)
    end
  end
end