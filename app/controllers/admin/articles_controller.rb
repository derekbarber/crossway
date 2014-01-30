module Admin
  class ArticlesController < ApplicationController
    before_action :load_article, only: [:edit, :update, :destroy]
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


    def new
      @article = Article.new
    end

    def edit
    end

    def create
      @article = Article.new(article_params)

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

    def update
      if @article.update_attributes(article_params)
        redirect_to admin_articles_url, notice: 'Article was successfully updated.'
      else
        render action: "edit"
      end
    end

    def destroy
      @article.destroy
      redirect_to admin_articles_url, notice: 'Article was successfully destroyed.'
    end

  private

    def load_article
      @article = Article.friendly.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:author, :content, :published_at, :title, :image, :status)
    end
  end
end
