module Admin
  class UsersController < ApplicationController
    before_filter :authorize

    # GET /people
    # GET /people.json
    def index
      @users = User.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @people }
      end
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(params[:user])
      if @user.save
        session[:user_id] = @user.id
        redirect_to root_url, notice: "Thank you for signing up!"
      else
        render "new"
      end
    end
  end
end