module Admin
  class UsersController < ApplicationController
    before_filter :authorize

    # GET /people
    # GET /people.json
    def index
      @users = User.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @users }
      end
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(params[:user])
      if @user.save
        session[:user_id] = @user.id
        redirect_to admin_users_url, notice: "User was successfully created."
      else
        render "new"
      end
    end

    # GET /user/1/edit
    def edit
      @user = User.find(params[:id])
    end

    # PUT /user/1
    # PUT /user/1.json
    def update
      @user = User.find(params[:id])

      respond_to do |format|
        if @user.update_attributes(params[:user])
          format.html { redirect_to admin_users_path, notice: 'User was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /user/1
    # DELETE /user/1.json
    def destroy
      @user = User.find(params[:id])
      @user.destroy

      respond_to do |format|
        format.html { redirect_to admin_users_url }
        format.json { head :no_content }
      end
    end
  private

    def user_params
      params.require(:article).permit(:author, :content, :published_at, :title, :image, :status)
    end
  end
end