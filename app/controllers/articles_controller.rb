class ArticlesController < ApplicationController
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

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])

    @articles = Article.first(4)
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article }
    end
  end
end
