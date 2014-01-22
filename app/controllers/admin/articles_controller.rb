module Admin
  class ArticlesController < ApplicationController
    before_filter :authorize

    # GET /articles
    # GET /articles.json
    def index
      @articles = Article.order("published_at desc")

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @articles }
        format.atom { render :layout => false }

        # we want the RSS feed to redirect permanently to the ATOM feed
        format.rss { redirect_to feed_path(:format => :atom), :status => :moved_permanently }
      end
    end

    # GET /articles/new
    # GET /articles/new.json
    def new
      @article = Article.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @article }
      end
    end

    # GET /articles/1/edit
    def edit
      @article = Article.friendly.find(params[:id])
    end

    # POST /articles
    # POST /articles.json
    def create
      @article = Article.new(params[:article])

      respond_to do |format|
        if @article.save
          format.html { redirect_to admin_articles_url, notice: 'Article was successfully created.' }
          format.json { render json: @article, status: :created, location: @article }
        else
          format.html { render action: "new" }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
    end

    # PUT /articles/1
    # PUT /articles/1.json
    def update
      @article = Article.friendly.find(params[:id])

      respond_to do |format|
        if @article.update_attributes(params[:article])
          format.html { redirect_to admin_articles_url, notice: 'Article was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /articles/1
    # DELETE /articles/1.json
    def destroy
      @article = Article.friendly.find(params[:id])
      @article.destroy

      respond_to do |format|
        format.html { redirect_to admin_articles_url }
        format.json { head :no_content }
      end
    end
  end
end
