class ArticlesController < ApplicationController

  def index
    @articles = Article.order("published_at desc").paginate(:page => params[:page], :per_page => 4)

    @recent_articles = Article.last(4)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
      format.atom { render :layout => false }

      # we want the RSS feed to redirect permanently to the ATOM feed
      format.rss { redirect_to feed_path(:format => :atom), :status => :moved_permanently }
    end
  end

  def show
    @article = Article.friendly.find(params[:id])
    @articles = Article.last(4)

    if request.path != article_path(@article)
      redirect_to @article, status: :moved_permanently
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article }
    end
  end
end
